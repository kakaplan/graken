class AddIdentifierToRental < ActiveRecord::Migration[7.0]
  def change
    add_column :rentals, :identifier, :integer
  end
end
