class CreateDares < ActiveRecord::Migration
  def change
    create_table :dares do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :dares, [:user_id, :created_at]
  end
end
