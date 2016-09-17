Rails.application.routes.draw do
  root 'message#new'
  post 'start', to: 'message#start'
  mount ActionCable.server => '/cable'
end
