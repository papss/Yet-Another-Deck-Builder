class RemoveNameFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :name, :string
    remove_column :cards, :set, :string
    remove_column :cards, :rarity, :string
    remove_column :cards, :colors, :string, array: true, default: []
    remove_column :cards, :mana_cost, :string
    remove_column :cards, :power, :integer
    remove_column :cards, :toughness, :integer
    remove_column :cards, :legalities, :string, array: true, default: []
    remove_column :cards, :image_uris, :string
    remove_column :cards, :card_type, :string
    remove_column :cards, :oracle_text, :text
  end
end
