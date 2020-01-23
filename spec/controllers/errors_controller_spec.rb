require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do

  before(:each) do
    get :index
  end

  it "displays the 404 page" do
    expect(response.status).to be(404)
  end

  it 'displays a flash notice, telling the user the status code' do
    expect(flash[:alert]).to eq "Status 404"
  end
end
