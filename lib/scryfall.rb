require 'httparty'

class Scryfall
  include HTTParty
  format :json

  base_uri 'api.scryfall.com'

  # initialize attributes:
  attr_accessor :id, :arena_id, :name, :set, :rarity, :colors, :mana_cost, :power,
                :toughness, :legalities, :scryfall_uri, :image_uris

  # associate attributes with JSON response keys:
  def initialize(response)
    @id = response['id']
    @arena_id = response['arena_id']
    @name = response['name']
    @set = response['set']
    @rarity = response['rarity']
    @colors = response['colors']
    @mana_cost = response['mana_cost']
    @power = response['power']
    @toughness = response['toughness']
    @legalities = response['legalities']['standard']  #['modern']['legacy']
    @scryfall_uri = response['scryfall_uri']
    @image_uris = response['image_uris']['normal']  #['normal']['large']
  end

  # query the API endpoint:
  def self.get_card(card_name)
    response = get("/cards/named?fuzzy=#{card_name}")
    if response.success?
      new(response)
    else
      # use plains as a placeholder fallback
      response = get("/cards/named?fuzzy=plains")
      new(response)
    end
  end

end
