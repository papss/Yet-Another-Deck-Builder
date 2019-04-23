class AddNameToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :name, :string
    add_column :cards, :colors, :string, array: true, default: []
    add_column :cards, :mana_cost, :string
    add_column :cards, :image_uris, :string
    add_column :cards, :card_type, :string
  end
end
