class CreateVarietes < ActiveRecord::Migration[5.1]
  def change
    create_table :varietes do |t|
      t.string :name

      t.timestamps
    end
  end
end
