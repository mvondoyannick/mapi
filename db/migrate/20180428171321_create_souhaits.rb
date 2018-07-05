class CreateSouhaits < ActiveRecord::Migration[5.1]
  def change
    create_table :souhaits do |t|
      t.string :title
      t.string :detail

      t.timestamps
    end
  end
end
