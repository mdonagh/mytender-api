module UserRetriever
  extend ActiveSupport::Concern

  def current_user
    if request.path == "/graphql" && "createUser" == JSON.parse(request.body.string)["operationName"]
      return
    end

    puts 'woof'
    puts token
    @current_user ||= AuthToken.verify(token)
    puts @current_user
    puts "-----"
    Current.user = @current_user
    @current_user
  end

  private

  def token
    @token ||= authorization_headers&.split(' ')&.last
  end

  def authorization_headers
    request.headers['Authorization']
  end
end
