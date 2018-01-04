require './app/services/csv_reader'

namespace :import do
  desc "load data into dev db"
  task :mice => :environment do
    reader = CSVReader.new('app/data/mouse_attributes.csv')
    reader.csv_to_mice
  end
end
