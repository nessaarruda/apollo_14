Rails.application.routes.draw do
  resources :astronaut_missions
  resources :astronauts
  resources :missions
end
