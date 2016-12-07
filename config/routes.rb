WebmoneyHq::Engine.routes.draw do
  get 'request' , to: 'hq#index', format: 'xml', as: 'hq'
end

