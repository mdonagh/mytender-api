module UserRetriever
  extend ActiveSupport::Concern

  def current_user
    @current_user ||= AuthToken.verify(token)
    # remove below later when auth is complete
    @current_user ||= User.last
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
