class RemoveExpDateColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :cards, :exp_date
  end
end
