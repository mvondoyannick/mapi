class CreateCalendriers < ActiveRecord::Migration[5.1]
  def change
    create_table :calendriers do |t|
      t.string :date

      t.timestamps
    end
  end
end
