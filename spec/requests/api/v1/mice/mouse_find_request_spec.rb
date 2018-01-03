require "rails_helper"

describe "find mouse API" do
  before do
    create_list(:mouse, 2)
  end

    let(:mouse1) { Mouse.first }
    let(:mouse2) { Mouse.second }

  it "responds with all attributes of a mouse" do
    get "/api/v1/mice/find?id=#{mouse1.id}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(1)
    expect(mouse_info[0]).to have_value(mouse1.id)
    expect(mouse_info[0]).to have_value(mouse1.original_id)
    expect(mouse_info[0]).to have_value(mouse1.trisomic)
    expect(mouse_info[0]).to have_value(mouse1.protein_ug_per_ml)
    expect(mouse_info[0]).to have_value(mouse1.diet)
    expect(mouse_info[0]).to have_value(mouse1.color)
    expect(mouse_info[0]).to have_value(mouse1.sex)
    expect(mouse_info[0]).to have_value(mouse1.date_of_birth)
    expect(mouse_info[0]).to have_value(mouse1.experiment_start_date)
    expect(mouse_info[0]).to have_value(mouse1.harvest_date)
    expect(mouse_info[0]).to have_value(mouse1.group)
    expect(mouse_info[0]).to have_value(mouse1.harvest_brain_temp)
    expect(mouse_info[0]).to have_value(mouse1.weight_in_grams)
  end

  it "finds by original id" do
    get "/api/v1/mice/find?original_id=#{mouse1.original_id}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)[0]

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
  end

  it "finds trisomic" do
    trisomic_mouse = create(:mouse_trisomic_true)
    trisomic_mouse2 = create(:mouse_trisomic_true)
    get "/api/v1/mice/find?trisomic=#{trisomic_mouse.trisomic}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(trisomic_mouse.id)
    expect(mouse_info[1]).to have_value(trisomic_mouse2.id)
  end

  it "finds by protein" do
    high_protein_mouse = create(:mouse_high_protein)
    high_protein_mouse2 = create(:mouse_high_protein)
    get "/api/v1/mice/find?protein_ug_per_ml=#{high_protein_mouse.protein_ug_per_ml.floor}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(high_protein_mouse.id)
    expect(mouse_info[1]).to have_value(high_protein_mouse2.id)
  end

  it "finds by diet" do
    rapa_mouse = create(:mouse_rapa_diet)
    rapa_mouse2 = create(:mouse_rapa_diet)
    get "/api/v1/mice/find?diet=#{rapa_mouse.diet}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(rapa_mouse.id)
    expect(mouse_info[1]).to have_value(rapa_mouse2.id)
  end

  it "finds by color" do
    black_mouse = create(:mouse_black)
    black_mouse2 = create(:mouse_black)
    get "/api/v1/mice/find?color=#{black_mouse.color}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(black_mouse.id)
    expect(mouse_info[1]).to have_value(black_mouse2.id)
  end

  it "finds by sex" do
    female_mouse = create(:mouse_female)
    female_mouse2 = create(:mouse_female)
    get "/api/v1/mice/find?sex=#{female_mouse.sex}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(female_mouse.id)
    expect(mouse_info[1]).to have_value(female_mouse2.id)
  end

  it "finds by date of birth" do
    newborn_mouse = create(:mouse_born_yesterday)
    newborn_mouse2 = create(:mouse_born_yesterday)
    get "/api/v1/mice/find?date_of_birth=#{newborn_mouse.date_of_birth}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(newborn_mouse.id)
    expect(mouse_info[1]).to have_value(newborn_mouse2.id)
  end

  it "finds by experiment start date" do
    experiment_start_mouse = create(:mouse_started_today)
    experiment_start_mouse2 = create(:mouse_started_today)
    get "/api/v1/mice/find?experiment_start_date=#{experiment_start_mouse.experiment_start_date}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(experiment_start_mouse.id)
    expect(mouse_info[1]).to have_value(experiment_start_mouse2.id)
  end

  it "finds by harvest date" do
    harvest_mouse = create(:mouse_harvested_tomorrow)
    harvest_mouse2 = create(:mouse_harvested_tomorrow)
    get "/api/v1/mice/find?harvest_date=#{harvest_mouse.harvest_date}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(harvest_mouse.id)
    expect(mouse_info[1]).to have_value(harvest_mouse2.id)
  end

  it "finds by group number" do
    group_12_mouse = create(:mouse_group_twelve)
    group_12_mouse2 = create(:mouse_group_twelve)
    get "/api/v1/mice/find?group=#{group_12_mouse.group}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(group_12_mouse.id)
    expect(mouse_info[1]).to have_value(group_12_mouse2.id)
  end

  xit "finds by temperature" do
    get "/api/v1/mice/find?mean_temp=80"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(experiment_start_mouse.id)
    expect(mouse_info[1]).to have_value(experiment_start_mouse2.id)
  end

  xit "finds by weight in grams" do
    get "/api/v1/mice/find?weight_in_grams=40"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(experiment_start_mouse.id)
    expect(mouse_info[1]).to have_value(experiment_start_mouse2.id)
  end

  xit "finds by status" do
    live_mouse = create(:mouse_live)
    live_mouse2 = create(:mouse_live)
    get "/api/v1/mice/find?status=live_mouse.status"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info.count).to eq(2)
    expect(mouse_info[0]).to have_value(live_mouse.id)
    expect(mouse_info[1]).to have_value(live_mouse2.id)
  end
end
