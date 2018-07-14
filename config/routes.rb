Rails.application.routes.draw do
  root "multi_agent_services#index"
  resources :multi_agent_services
end
