class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.references :catalogue, foreign_key: true
      t.string :name
      t.string :description
      t.integer :expiration, default: 2
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
