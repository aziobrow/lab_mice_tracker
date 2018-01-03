require 'rails_helper'

describe CSVReader do
  let(:reader)  { CSVReader.new('/data/mouse_attributes.csv') }

  it "intializes with a csv file" do
    expect(reader.csv_file).to eq('/data/mouse_attributes.csv')
  end

  it "converts string value to a boolean" do
    expect(reader.to_boolean("Yes")).to eq(true)
    expect(reader.to_boolean("yes")).to eq(true)
    expect(reader.to_boolean("False")).to eq(false)
    expect(reader.to_boolean("false")).to eq(false)
    expect(reader.to_boolean("xyz")).to eq(nil)
  end

end
