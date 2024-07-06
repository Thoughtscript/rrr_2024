Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get '/examples', to: 'examples#index'
  get '/examples/all', to: 'examples#list'
  get '/examples/:id', to: 'examples#getOne'
  post '/examples', to: 'examples#create'
  put '/examples/:id', to: 'examples#update'
  delete '/examples/:id', to: 'examples#delete'

  delete '/examples/:id/subexamples/:sid', to: 'examples#deleteSubExample'
  post '/subexamples', to: 'examples#createSubExample'
  get '/examples/:id/subexamples', to: 'examples#getSubExamples'
  get '/subexamples/:id', to: 'examples#getSubExample'
  
  resources :examples, :sub_examples
  # The line above will automatically attempt to create several default mappings 
  # Be forewarned that index and index.erb are mapped by default to /<MY_ENTITY>
  ## (you can test that by commenting it out)
end
