class AddThemeNameToBikes < ActiveRecord::Migration[7.0]
  def change
    add_column :bikes, :theme_name, :string
  end
end
