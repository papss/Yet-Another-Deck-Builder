class Deck < ApplicationRecord
  has_many :cards
  validates :name, :presence => {:message => 'Name cannot be blank'}
end
