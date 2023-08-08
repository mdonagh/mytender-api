class GraphqlController < ApplicationController
  include GraphqlRequestResolver

  def execute
    pp params

    result = resolve(query: params, context: context)
    pp result
    render json: result
  end

  private

  def context
    ap current_user
    ap request.headers
    { user: current_user }
  end
end
