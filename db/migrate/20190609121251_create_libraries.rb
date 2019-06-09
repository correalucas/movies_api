class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.references :user, foreign_key: true
      t.references :option, foreign_key: true
      t.boolean :alive, default: true

      t.timestamps
    end
  end
end
