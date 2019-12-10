class AddSlugToConfigs < ActiveRecord::Migration[5.2]
  def change
    add_column(:configs, :slug, :string, :length => 15, foreign_key: true)
  end
end
