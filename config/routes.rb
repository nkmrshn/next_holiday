NextHoliday::Application.routes.draw do
  resources :home, :only => [:index]
  resources :twitter, :path => '/admin', :only => [:index, :show]

  match '/callback',  :to => 'twitter#show'

  root :to => "home#index"
end
