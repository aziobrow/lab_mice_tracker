require 'rails_helper'

describe "Mouse API" do
  it "sends a list of mice" do
    create_list(:mouse, 3)

    get '/api/v1/mice'

    expect(response).to be_success
  end
end
