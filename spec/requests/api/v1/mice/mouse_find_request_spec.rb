require "rails_helper"

describe "find mouse API" do
    let(:mouse1) { create(:mouse) }
    let(:mouse2)  { create(:mouse, trisomic: true) }
    let(:mouse3) { create(:mouse, trisomic: true, protein_ug_per_ml: 3.1893) }
    let(:mouse4)  { create(:mouse, trisomic: true, protein_ug_per_ml: 3.2652) }
    let(:mouse5)  { create(:mouse, diet: 'Rapa') }
    let(:mouse6)  { create(:mouse, diet: 'Rapa', color: 'Black')  }
    let(:mouse7)  { create(:mouse, diet: 'Rapa', color: 'Black', date_of_birth: '1/1/2017') }
    let(:mouse8)  { create(:mouse, sex: 'female', date_of_birth: '1/1/2017', experiment_start_date: "3/1/2017") }
    let(:mouse9)  { create(:mouse, experiment_start_date: "3/1/2017", harvest_date: "12/31/2017") }
    let(:mouse10)  { create(:mouse, harvest_date: "12/31/2017", group: "12") }
    let(:mouse11) { create(:mouse, group: "12", mean_temp: 87.5) }
    let(:mouse12) { create(:mouse, mean_temp: 87.5, weight_in_grams: 44.6)  }
    let(:mouse13) { create(:mouse, mean_temp: 84.8, weight_in_grams: 41.3)  }

  before do
    mouse1
    mouse2
    mouse3
    mouse4
    mouse5
    mouse6
    mouse7
    mouse8
    mouse9
    mouse10
    mouse11
    mouse12
    mouse13
  end

  it "responds with all attributes of a mouse" do
    get "/api/v1/mice/find?id=#{mouse1.id}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse1.id)
    expect(mouse_info).to have_value(mouse1.original_id)
    expect(mouse_info).to have_value(mouse1.trisomic)
    expect(mouse_info).to have_value(mouse1.protein_ug_per_ml)
    expect(mouse_info).to have_value(mouse1.diet)
    expect(mouse_info).to have_value(mouse1.color)
    expect(mouse_info).to have_value(mouse1.sex)
    expect(mouse_info).to have_value(mouse1.date_of_birth)
    expect(mouse_info).to have_value(mouse1.experiment_start_date)
    expect(mouse_info).to have_value(mouse1.harvest_date)
    expect(mouse_info).to have_value(mouse1.group)
    expect(mouse_info).to have_value(mouse1.mean_temp)
    expect(mouse_info).to have_value(mouse1.weight_in_grams)
  end

  it "finds by original id" do
    get "/api/v1/mice/find?original_id=#{mouse1.original_id}"
    first_mouse_info = JSON.parse(response.body, symbolize_names: true)[0]
    expect(response).to be_success
    expect(first_mouse_info).to have_value(mouse1.id)
    expect(first_mouse_info).to_not have_value(mouse2.id)
    expect(first_mouse_info).to_not have_value(mouse3.id)
    expect(first_mouse_info).to_not have_value(mouse4.id)
    expect(first_mouse_info).to_not have_value(mouse5.id)
    expect(first_mouse_info).to_not have_value(mouse6.id)
    expect(first_mouse_info).to_not have_value(mouse7.id)
    expect(first_mouse_info).to_not have_value(mouse8.id)
    expect(first_mouse_info).to_not have_value(mouse9.id)
    expect(first_mouse_info).to_not have_value(mouse10.id)
    expect(first_mouse_info).to_not have_value(mouse11.id)
    expect(first_mouse_info).to_not have_value(mouse12.id)
    expect(first_mouse_info).to_not have_value(mouse13.id)
  end

  it "finds trisomic" do
    get "/api/v1/mice/find?trisomic=#{mouse2.trisomic}"
    first_mouse_info = JSON.parse(response.body, symbolize_names: true)[0]
    second_mouse_info = JSON.parse(response.body, symbolize_names: true)[1]

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse2.id)
    expect(mouse_info).to have_value(mouse3.id)
    expect(mouse_info).to have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse5.id)
    expect(mouse_info).to_not have_value(mouse6.id)
    expect(mouse_info).to_not have_value(mouse7.id)
    expect(mouse_info).to_not have_value(mouse8.id)
    expect(mouse_info).to_not have_value(mouse9.id)
    expect(mouse_info).to_not have_value(mouse10.id)
    expect(mouse_info).to_not have_value(mouse11.id)
    expect(mouse_info).to_not have_value(mouse12.id)
    expect(mouse_info).to_not have_value(mouse13.id)
  end

  it "finds by protein" do
    get "/api/v1/mice/find?protein_ug_per_ml=3"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse3.id)
    expect(mouse_info).to have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
    expect(mouse_info).to_not have_value(mouse5.id)
    expect(mouse_info).to_not have_value(mouse6.id)
    expect(mouse_info).to_not have_value(mouse7.id)
    expect(mouse_info).to_not have_value(mouse8.id)
    expect(mouse_info).to_not have_value(mouse9.id)
    expect(mouse_info).to_not have_value(mouse10.id)
    expect(mouse_info).to_not have_value(mouse11.id)
    expect(mouse_info).to_not have_value(mouse12.id)
    expect(mouse_info).to_not have_value(mouse13.id)
  end

  it "finds by diet" do
    get "/api/v1/mice/find?diet=#{mouse5.diet}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse5.id)
    expect(mouse_info).to have_value(mouse6.id)
    expect(mouse_info).to have_value(mouse7.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
    expect(mouse_info).to_not have_value(mouse3.id)
    expect(mouse_info).to_not have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse8.id)
    expect(mouse_info).to_not have_value(mouse9.id)
    expect(mouse_info).to_not have_value(mouse10.id)
    expect(mouse_info).to_not have_value(mouse11.id)
    expect(mouse_info).to_not have_value(mouse12.id)
    expect(mouse_info).to_not have_value(mouse13.id)
  end

  it "finds by color" do
    get "/api/v1/mice/find?color=#{mouse6.color}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse6.id)
    expect(mouse_info).to have_value(mouse7.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
    expect(mouse_info).to_not have_value(mouse3.id)
    expect(mouse_info).to_not have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse5.id)
    expect(mouse_info).to_not have_value(mouse8.id)
    expect(mouse_info).to_not have_value(mouse9.id)
    expect(mouse_info).to_not have_value(mouse10.id)
    expect(mouse_info).to_not have_value(mouse11.id)
    expect(mouse_info).to_not have_value(mouse12.id)
    expect(mouse_info).to_not have_value(mouse13.id)
  end

  it "finds by sex" do
    get "/api/v1/mice/find?sex=#{mouse8.sex}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse8.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
    expect(mouse_info).to_not have_value(mouse3.id)
    expect(mouse_info).to_not have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse5.id)
    expect(mouse_info).to_not have_value(mouse6.id)
    expect(mouse_info).to_not have_value(mouse7.id)
    expect(mouse_info).to_not have_value(mouse9.id)
    expect(mouse_info).to_not have_value(mouse10.id)
    expect(mouse_info).to_not have_value(mouse11.id)
    expect(mouse_info).to_not have_value(mouse12.id)
    expect(mouse_info).to_not have_value(mouse13.id)
  end

  it "finds by date of birth" do
    get "/api/v1/mice/find?date_of_birth=#{mouse7.date_of_birth}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse7.id)
    expect(mouse_info).to have_value(mouse8.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
    expect(mouse_info).to_not have_value(mouse3.id)
    expect(mouse_info).to_not have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse5.id)
    expect(mouse_info).to_not have_value(mouse6.id)
    expect(mouse_info).to_not have_value(mouse9.id)
    expect(mouse_info).to_not have_value(mouse10.id)
    expect(mouse_info).to_not have_value(mouse11.id)
    expect(mouse_info).to_not have_value(mouse12.id)
    expect(mouse_info).to_not have_value(mouse13.id)
  end

  it "finds by experiment start date" do
    get "/api/v1/mice/find?experiment_start_date=#{mouse8.experiment_start_date}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse8.id)
    expect(mouse_info).to have_value(mouse9.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
    expect(mouse_info).to_not have_value(mouse3.id)
    expect(mouse_info).to_not have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse5.id)
    expect(mouse_info).to_not have_value(mouse6.id)
    expect(mouse_info).to_not have_value(mouse7.id)
    expect(mouse_info).to_not have_value(mouse10.id)
    expect(mouse_info).to_not have_value(mouse11.id)
    expect(mouse_info).to_not have_value(mouse12.id)
    expect(mouse_info).to_not have_value(mouse13.id)
  end

  it "finds by harvest date" do
    get "/api/v1/mice/find?harvest_date=#{mouse9.harvest_date}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse9.id)
    expect(mouse_info).to have_value(mouse10.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
    expect(mouse_info).to_not have_value(mouse3.id)
    expect(mouse_info).to_not have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse5.id)
    expect(mouse_info).to_not have_value(mouse6.id)
    expect(mouse_info).to_not have_value(mouse7.id)
    expect(mouse_info).to_not have_value(mouse8.id)
    expect(mouse_info).to_not have_value(mouse11.id)
    expect(mouse_info).to_not have_value(mouse12.id)
    expect(mouse_info).to_not have_value(mouse13.id)
  end

  it "finds by group number" do
    get "/api/v1/mice/find?group=#{mouse10.group}"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse10.id)
    expect(mouse_info).to have_value(mouse11.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
    expect(mouse_info).to_not have_value(mouse3.id)
    expect(mouse_info).to_not have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse5.id)
    expect(mouse_info).to_not have_value(mouse6.id)
    expect(mouse_info).to_not have_value(mouse7.id)
    expect(mouse_info).to_not have_value(mouse8.id)
    expect(mouse_info).to_not have_value(mouse9.id)
    expect(mouse_info).to_not have_value(mouse12.id)
    expect(mouse_info).to_not have_value(mouse13.id)
  end

  it "finds by mean temperature" do
    get "/api/v1/mice/find?mean_temp=80"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse11.id)
    expect(mouse_info).to have_value(mouse12.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
    expect(mouse_info).to_not have_value(mouse3.id)
    expect(mouse_info).to_not have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse5.id)
    expect(mouse_info).to_not have_value(mouse6.id)
    expect(mouse_info).to_not have_value(mouse7.id)
    expect(mouse_info).to_not have_value(mouse8.id)
    expect(mouse_info).to_not have_value(mouse9.id)
    expect(mouse_info).to_not have_value(mouse10.id)
    expect(mouse_info).to_not have_value(mouse13.id)
  end

  it "finds by weight in grams" do
    get "/api/v1/mice/find?weight_in_grams=40"
    mouse_info = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_success
    expect(mouse_info).to have_value(mouse12.id)
    expect(mouse_info).to have_value(mouse13.id)
    expect(mouse_info).to_not have_value(mouse1.id)
    expect(mouse_info).to_not have_value(mouse2.id)
    expect(mouse_info).to_not have_value(mouse3.id)
    expect(mouse_info).to_not have_value(mouse4.id)
    expect(mouse_info).to_not have_value(mouse5.id)
    expect(mouse_info).to_not have_value(mouse6.id)
    expect(mouse_info).to_not have_value(mouse7.id)
    expect(mouse_info).to_not have_value(mouse8.id)
    expect(mouse_info).to_not have_value(mouse9.id)
    expect(mouse_info).to_not have_value(mouse10.id)
    expect(mouse_info).to_not have_value(mouse11.id)
  end
end
