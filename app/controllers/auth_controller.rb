class AuthController < ApplicationController

  # def show
  # render json: {
  #   id: current_user.id,
  #   username: current_user.username
  # }
  # end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      payload = { user_id: @user.id }
      render json: {user: UserSerializer.new(@user), token: issue_token(payload)}
    else
      render json: {message: "Something went wrong."}
    end
  end

  def show
  if cur_user
    render json: cur_user
  else
    render json: {error: "Hold your horses!"}
  end
end

end
