# frozen_string_literal: true

class ApplicationController < ActionController::API
  SECRET = ENV.fetch('SECRET_KEY_JWT')

  def authentication
    decode_data = decode_user_data(request.headers['token'])
    user_data = decode_data[0]['user_id'] if decode_data
    user = User.find(user_data&.id)

    return true if user

    render(json: { message: 'invalid credentials' })
  end

  def encode_user_data(payload)
    JWT.encode(payload, SECRET, 'HS256')
  end

  def decode_user_data(token)
    JWT.decode(token, SECRET, true, { algorithm: 'HS256' })
  rescue StandardError => e
    Rails.logger.debug(e)
  end
end
