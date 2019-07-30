class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
