class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :uid
      t.string :title
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
