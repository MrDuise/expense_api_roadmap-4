class ApplicationController < ActionController::API
  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    return render json: { error: 'Token missing' }, status: :unauthorized unless token

    begin
      decoded_token = JWT.decode(token, Rails.application.credentials.secret_key_base, true, algorithm: 'HS256')
      @current_user = User.find(decoded_token[0]['user_id'])
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end