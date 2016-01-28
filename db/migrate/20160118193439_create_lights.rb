class CreateLights < ActiveRecord::Migration
  def change
    create_table :lights do |t|
      t.string :name
      t.integer :location_id
      t.string :on_code
      t.string :off_code

      t.timestamps null: false
    end
  end
end
