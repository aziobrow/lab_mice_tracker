require 'rails_helper'

describe CSVReader do
  let(:reader)  { CSVReader.new('/data/mouse_attributes.csv') }

  it "intializes with a csv file" do
    expect(reader.csv_file).to eq('/data/mouse_attributes.csv')
  end

  it "converts trisomic value to a boolean" do
    expect(reader.clean_trisomic("Yes")).to eq(true)
    expect(reader.clean_trisomic("yes")).to eq(true)
    expect(reader.clean_trisomic("No")).to eq(false)
    expect(reader.clean_trisomic("no")).to eq(false)
    expect(reader.clean_trisomic("xyz")).to eq(nil)
    expect(reader.clean_trisomic("")).to eq(nil)
  end

  it "identifies valid floats" do
    expect(reader.is_float?("1")).to eq(true)
    expect(reader.is_float?("54.842")).to eq(true)
    expect(reader.is_float?("")).to eq(false)
    expect(reader.is_float?("xyz")).to eq(false)
  end

  it "converts protein value to a float" do
    expect(reader.clean_protein("")).to eq(nil)
    expect(reader.clean_protein("xyz")).to eq(nil)
    expect(reader.clean_protein("2.6145")).to eq(2.6145)
  end

  it "converts diet value" do
    expect(reader.clean_diet("")).to eq(nil)
    expect(reader.clean_diet("xyz")).to eq(nil)
    expect(reader.clean_diet("Rapamycin")).to eq("rapamycin")
    expect(reader.clean_diet("Rapa")).to eq("rapamycin")
    expect(reader.clean_diet("Cont")).to eq("control")
    expect(reader.clean_diet("Control")).to eq("control")
  end

  it "converts color value" do
    expect(reader.clean_color("")).to eq(nil)
    expect(reader.clean_color("xyz")).to eq(nil)
    expect(reader.clean_color("black")).to eq("black")
    expect(reader.clean_color("agouti")).to eq("agouti")
  end

  it "converts gender value" do
    expect(reader.clean_gender("")).to eq(nil)
    expect(reader.clean_gender("xyz")).to eq(nil)
    expect(reader.clean_gender("Male")).to eq("male")
    expect(reader.clean_gender("Female")).to eq("female")
  end

  it "converts brain temp to float" do
    expect(reader.clean_brain_temp("")).to eq(nil)
    expect(reader.clean_brain_temp("xyz")).to eq(nil)
    expect(reader.clean_brain_temp("CD")).to eq("CD")
    expect(reader.clean_brain_temp("87.9")).to eq(87.9)
  end

  it "converts weight to float" do
    expect(reader.clean_brain_temp("")).to eq(nil)
    expect(reader.clean_brain_temp("n/a")).to eq(nil)
    expect(reader.clean_brain_temp("39.8")).to eq(39.8)
    expect(reader.clean_brain_temp("41.0")).to eq(41.0)
  end

end
