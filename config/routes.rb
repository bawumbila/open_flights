Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "api/v2/graphql"
  end

  
    end
  end

  get '*path', to: 'pages#index', via: :all
end
