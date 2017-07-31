class CreateMagzines < ActiveRecord::Migration
  def change
    create_table :magzines do |t|
      t.string :title
      t.string :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
