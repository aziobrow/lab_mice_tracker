require 'rails_helper'

describe "Mouse API" do
  it "sends a list of mice" do
    create_list(:mouse, 3)

    get api_v1_mice_path

    expect(response).to be_success

    mice = JSON.parse(response.body)
    expect(mice.count).to eq(3)
  end

  it "can show one mouse by its id" do
    mouse_id = create(:mouse).original_id

    get api_v1_mouse_path(mouse_id)

    mouse = JSON.parse(response.body)

    expect(response).to be_success
    expect(mouse['original_id']).to eq(mouse_id)
  end
end
