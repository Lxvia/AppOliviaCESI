class CreateTagGossipJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tags, :gossips do |t|
      t.index [:tag_id, :gossip_id]
      # Ajoutez d'autres colonnes si nécessaire
    end
  end
end
