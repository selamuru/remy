# Menu Importer
# This script imports all the menus in a CSV format in the tools/menus directory into a local instance of ES.
# The expected format of the CSV files is as follows: [Restaurant, Dish Type, Name, Description].
#
# To run this script:
# 1) Make sure that you have ES running locally: elasticsearch
# 2) Check that ES is running locally: http://localhost:9200
# 3) Run the menu importer: bundle exec ruby tools/menu_importer.rb
# 4) Check the data in your local ES instance: http://localhost:9200/menus/_search?q=*&size=322

require "csv"
require "stretcher"

# Connect to ES
es = Stretcher::Server.new("http://localhost:9200")

# Delete existing menus index if necessary
es.index(:menus).delete rescue nil

es.index(:menus).create(mappings: { dish_metadata: { properties: {
    restaurant: { type: :string },
    dish_type: { type: :string },
    name: { type: :string },
    description: { type: :string }
} } })

id = 1;

Dir["tools/menus/*.csv"].each do |csv_file_path|
  require "byebug"; byebug
  menu = CSV.read(csv_file_path)
  menu.shift # get rid of the header row
  menu.each do |menu_item|
    es.index(:menus).type(:dish_metadata).put(id, {
      restaurant: menu_item[0], dish_type: menu_item[1], name: menu_item[2], description: menu_item[3]
    })
    id += 1
  end
end