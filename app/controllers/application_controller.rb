class ApplicationController < ActionController::API
  require 'filestack'

  def logged_in?
    !!cur_user
  end

  def cur_user
      begin
        # byebug
        token = request.headers["Authorization"].split(" ")[1]
        decoded_token = decode_token(token)
        if user_id = decoded_token[0]["user_id"]
          @user = User.find_by(id: user_id)
        else
        end
      rescue JWT::DecodeError
      end
end


  def issue_token(payload)
    token = JWT.encode(payload, ENV["my_token"], "HS256")
  end

  def decode_token(token)
    JWT.decode(token, ENV["my_token"], true, {algorithm: "HS256"})
  end

end
