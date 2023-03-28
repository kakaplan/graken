class ChangeCardNumToStringInCard < ActiveRecord::Migration[7.0]
  def change
    change_column :cards, :card_number, :string
  end
end
