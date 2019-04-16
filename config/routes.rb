Rails.application.routes.draw do

  resources :decks
  resources :cards

  get 'scryfall', to: 'cards#scryfall'
  root 'cards#index'

end
