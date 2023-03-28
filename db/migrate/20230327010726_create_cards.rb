class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :card_number
      t.integer :cv
      t.string :name
      t.date :exp_date

      t.timestamps
    end
  end
end
