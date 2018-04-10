class UsersController < ApplicationController

  def index
    @users = User.all
    render :json => {:users => @users}
  end


  def findUser
    @user = User.find_by(mag_url: params[:mag_url])
    @articles = Article.select{|a| a[:user_id] == @user.id}
    if @user
      render json: @user
      # render :json => {:user => @user,
      #   :articles => @articles, images: @user.images}
    else
      render json: {message: "Cant find"}
    end
  end


  def create
    @user = User.new(username: params[:username], password: params[:password])
    if @user.save
      payload = { user_id: @user.id }
      render json: {user: UserSerializer.new(@user), token: issue_token(payload)}
    else
      render json: {message: "Sucks to suck"}
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:mag_title, :mag_url, :mag_description)
  end

end
