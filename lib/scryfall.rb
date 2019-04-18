require 'httparty'

class Scryfall
  include HTTParty
  format :json

  base_uri 'api.scryfall.com'

  # initialize attributes:
  attr_accessor :id, :arena_id, :name, :set, :rarity, :colors, :mana_cost, :power,
                :toughness, :legalities, :scryfall_uri, :image_uris, :card_type,
                :card_text

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
    @card_type = response['type_line']
    @card_text = response['oracle_text']
  end

  # query the API endpoint:
  def self.get_card(card_name)
    response = get("/cards/named?fuzzy=#{card_name}")
    if response.success?
      @card = response
      new(response)
    else
      response.response
      new(response)
    end
  end

end
