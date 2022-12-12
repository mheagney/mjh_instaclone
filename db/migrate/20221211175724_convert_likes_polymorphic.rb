class ConvertLikesPolymorphic < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :likeable, polymorphic: true, null: false, index: true
    remove_column :likes, :post_id
  end
end
