class ArticlesController < ApplicationController
  # before_action :cur_user, only: [:show]
  before_action :logged_in?, only: [:index]

  def index
    @articles =  Article.where(:user_id => cur_user.id)
    render json: @articles, each_serializer: ArticleSerializer
    #
    # if logged_in?
    #    render json: {id: current_user.id, username: current_user.username}
    #  else
    #   render json: {alert: "Not Authorized"}
    #  end
  end

  def show
    @articles = Article.where(title: params[:title])
    @user = User.find_by(mag_url: params[:mag_url])
    # byebug
    @article = @articles.find_by(user_id: @user.id)
    render json: @article, each_serializer: ArticleSerializer
  end

  def upload
    uploaded = params[:file]
    user_id = params[:user_id]
    document = uploaded.tempfile
    parsedArticle = Nokogiri::XML(File.open(document))
    title = parsedArticle.xpath('//title').text
    subtitle = parsedArticle.xpath('//subtitle').text
    author = parsedArticle.xpath('//author').text
    body = parsedArticle.xpath('//body').text
    body_fixed = body.gsub! "\u2029", "\n"
    quote = parsedArticle.xpath('//quote').text
    img = parsedArticle.xpath('//img').attribute('href').value
    # byebug
    allArticles = User.find_by(id: user_id).articles.order(:position)
    if allArticles.any?
      position = allArticles.last[:position] + 1
    else
      position = 1
    end
    # trimmed_url = img[7..-1]
    @article = Article.new(user_id: user_id, title: title, subtitle: subtitle, author: author, body: body_fixed, quote: quote, img_name: img, position: position)


    if @article.save
      # filelink = client.upload(filepath: trimmed_url)
      # link = filelink.transform.url
      # @image = Image.create(article_id: @article.id, url: link)
      render json: @article
    else
      render json: {message: "Couldn't save the article"}
    end
  end

  def update
    @article = Article.find_by(id: params[:id])
    @article.update(article_params)
    render json: @article
  end

  def destroy
    client = FilestackClient.new(ENV["filestack_api_key"])
    @article = Article.find_by(id: params[:id])
    @article.destroy
    @image = Image.find_by(article_id: params[:id])
    # client.delete(@image[:handle])
    @image.destroy
    render json: @article
  end

  private
  def article_params
    params.require(:article).permit(:title, :subtitle, :author, :body, :quote)

  end

end
