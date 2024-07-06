Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*', 'http://localhost:1234'
      resource '*', headers: :any, methods: [:get, :delete, :put, :post]
    end
  end