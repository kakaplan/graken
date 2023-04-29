class CleanupBikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :bikes, :status
    remove_column :bikes, :battery
    remove_column :bikes, :mileage
  end
end
