Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins 'http://localhost:3000'
        resource "*", headers: :any, methods: [:get, :put, :post, :patch, :delete, :options, :head], credentials: true
    end

    allow do
        origins 'https://floating-ocean-43337.herokuapp.com/'
        resource "*", headers: :any, methods: [:get, :put, :post, :patch, :delete, :options, :head], credentials: true
    end
end