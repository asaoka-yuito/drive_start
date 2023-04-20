class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :course, null: false, default: 0
      t.string :name

      t.timestamps
    end
  end
end
