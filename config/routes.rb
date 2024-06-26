Rails.application.routes.draw do
  resources :deleterequests
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute'

  mount ActionCable.server, at: '/cable'
  post '/graphql', to: 'graphql#execute'
  post '/payment-sheet', to: 'payments#sheet'

  get '/privacy', to: 'privacy#show'
end
