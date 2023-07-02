class GraphqlController < ApplicationController
  include GraphqlRequestResolver

  def execute
    result = resolve(query: params, context: context)
    render json: result
  end

  private

  def context
    ap current_user
    ap request.headers
    { user: current_user }
  end
end
