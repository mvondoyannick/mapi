class CreateQuartiers < ActiveRecord::Migration[5.1]
  def change
    create_table :quartiers do |t|
      t.string :name
      t.references :arrondissement, foreign_key: true

      t.timestamps
    end
  end
end
