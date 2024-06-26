class AuthToken
  KEY = ENV.fetch('JWT_ENCODING_KEY')
  ALGORITHM = 'HS256'.freeze

  def self.token(user)
    payload = { user_id: user.id }
    JWT.encode(payload, KEY, ALGORITHM)
  end

  def self.verify(token)
    puts KEY
    puts token

    if !token
      raise GraphQL::ExecutionError, "Missing auth token"
    end

    decoded_token = JWT.decode(token, KEY, true, { algorithm: ALGORITHM })

    User.find_by(id: decoded_token.first['user_id'])
  end
end
