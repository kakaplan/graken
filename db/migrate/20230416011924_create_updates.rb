class CreateUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :updates do |t|
      t.string :title
      t.string :text

      t.timestamps
    end
  end
end
