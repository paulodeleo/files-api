Rails.application.routes.draw do
  get 'files/:tags/:page', to: 'file_uploads#index'
  post 'file', to: 'file_uploads#create'
end
