TopList::Application.routes.draw do
  devise_for :users

  resources :polls do

    resources :entries

    member do
      post "lockdown"

      get "invitations"
      patch "send_invitations"

      post "vote" => "polls#vote"
    end

  end

  root "polls#index"

end
