class CreateMarkets < ActiveRecord::Migration[5.1]
  def change
    create_table :markets do |t|
      t.string :name
      t.references :vil, foreign_key: true

      t.timestamps
    end
  end
end
