Rails.application.routes.draw do
  get "extractor/index"
  root 'extractor#index'
  post 'extract', to: 'extractor#extract'
end
