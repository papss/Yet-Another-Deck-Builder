class Card < ApplicationRecord
  belongs_to :deck
  validates :deck_id, :presence => {:message => 'Card must belong to a deck.'}
end
