class CreateBuildingOwnerships < ActiveRecord::Migration
  def change
    create_table :building_ownerships do |t|
      t.integer :building_id

      t.timestamps
    end
  end
end
