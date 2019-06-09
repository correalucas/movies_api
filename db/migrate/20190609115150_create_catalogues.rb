class CreateCatalogues < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogues do |t|
      t.string :category
      t.string :title
      t.text :plot

      t.timestamps
    end
  end
end
