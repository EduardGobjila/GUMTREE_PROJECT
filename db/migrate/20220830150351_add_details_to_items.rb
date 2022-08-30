class AddDetailsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :location, :string
    add_column :items, :phone, :integer
  end
end
