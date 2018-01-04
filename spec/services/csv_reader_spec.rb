require 'rails_helper'

describe CSVReader do
  let(:reader)  { CSVReader.new('app/data/mouse_attributes.csv') }

  it "intializes with a csv file" do
    expect(reader.csv_file).to eq('app/data/mouse_attributes.csv')
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
    expect(reader.clean_brain_temp("87.9")).to eq(87.9)
  end

  it "converts weight to float" do
    expect(reader.clean_brain_temp("")).to eq(nil)
    expect(reader.clean_brain_temp("n/a")).to eq(nil)
    expect(reader.clean_brain_temp("39.8")).to eq(39.8)
    expect(reader.clean_brain_temp("41.0")).to eq(41.0)
  end

  it "converts csv data into mice" do
    mice_reader = CSVReader.new('app/data/mouse_attributes_fixture.csv')
    mice_reader.csv_to_mice
    mouse = Mouse.first

    expect(Mouse.all.count).to eq(4)
    expect(mouse.original_id).to eq("4555-0")
    expect(mouse.trisomic).to eq(true)
    expect(mouse.protein_ug_per_ml).to eq(nil)
    expect(mouse.diet).to eq("rapamycin")
    expect(mouse.color).to eq("agouti")
    expect(mouse.sex).to eq("male")
    expect(mouse.date_of_birth).to eq("6/19/2011")
    expect(mouse.experiment_start_date).to eq("10/17/2011")
    expect(mouse.harvest_date).to eq("12/20/2011")
    expect(mouse.group_number).to eq("6")
    expect(mouse.harvest_brain_temp).to eq(93.2)
    expect(mouse.weight_in_grams).to eq(40.5)
  end

end
