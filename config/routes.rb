Rails.application.routes.draw do
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute'

  mount ActionCable.server, at: '/cable'
  post '/graphql', to: 'graphql#execute'
  post '/payment-sheet', to: 'payments#sheet'

end
