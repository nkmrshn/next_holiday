NextHoliday::Application.routes.draw do
  resources :twitter, :path => '/admin', :only => [:index, :show]

  match '/callback',  :to => 'twitter#show'
end
