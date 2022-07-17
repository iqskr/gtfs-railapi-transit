class Stop < ApplicationRecord
  has_many :stop_times

  def self.hash_from_gtfs(row)
    record = {}
    record[:stop_gid] = row.id
    record[:stop_code] = row.code
    record[:stop_name] = row.name
    record[:stop_desc] = row.desc
    record[:stop_lat] = row.lat
    record[:stop_lon] = row.lon
    record[:zone_gid] = row.zone_id
    record[:stop_url] = row.url
    record[:location_type] = row.location_type
    record[:parent_station] = row.parent_station
    record[:stop_timezone] = row.timezone
    record[:wheelchair_boarding] = row.wheelchair_boarding
    record
  end
end
