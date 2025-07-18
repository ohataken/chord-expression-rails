Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :notes, only: [ :index, :show ], param: :name

  resources :chords, only: [ :show ], param: :name

  resources :root_notes, only: [ :index ], param: :name do
    resources :root_notes_chords, only: [ :index ], path: "chords", param: :name
  end

  resources :chord_modifiers, only: [ :index ], param: :name do
    resources :chord_modifiers_chords, only: [ :index ], path: "chords", param: :name
  end

  resources :scales, only: [], param: :name do
    resources :scales_chords, only: [ :index ], path: "chords", param: :name
  end

  namespace :graphics do
    namespace :keyboards do
      resources :chords, only: [ :show ], param: :name
    end

    namespace :finger_boards do
      resources :chords, only: [ :show ], param: :name
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
