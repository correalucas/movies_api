class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.references :catalogue, foreign_key: true
      t.integer :number
      t.string :name

      t.timestamps
    end
  end
end
