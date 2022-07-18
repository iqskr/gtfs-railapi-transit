class CreateStops < ActiveRecord::Migration[7.0]
  def change
    create_table :stops do |t|
      t.string "stop_gid", null: false
      t.string "stop_code"
      t.string "stop_name", null: false
      t.string "stop_desc"
      t.decimal "stop_lat", precision: 10, scale: 6, null: false
      t.decimal "stop_lon", precision: 10, scale: 6, null: false
      t.string "zone_gid"
      t.string "stop_url"
      t.string "location_type"
      t.string "parent_station_gid"
      t.integer "parent_station_id"
      t.string "stop_timezone"
      t.string "wheelchair_boarding"
      t.index ["stop_gid"], name: "index_stops_on_stop_gid", unique: true
      t.timestamps
    end
  end
end
