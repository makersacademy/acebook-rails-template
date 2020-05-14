require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :controller do

  it "POST /registrations with correct credentials, responds with json status 200 and user details " do
    post :create, params: { 
      first_name: "Sam",
      last_name: "Gangi",
      email: "samgangi@lotr.com",
      password: "theshire"
    }
    json = JSON.parse(response.body)

    expect(json['status']).to eq "created"
    expect(json['user']['email']).to eq "samgangi@lotr.com"
    expect(json['user']['first_name']).to eq "Sam"
    expect(json['user']['last_name']).to eq "Gangi"
  end     

  it "POST /registrations with email already in use credentials, responds with json status 500 " do
    User.create(
      first_name: "Sam",
      last_name: "Gangi",
      email: "samgangi@lotr.com",
      password: "theshire"
    )
    post :create, params: { 
      first_name: "Someone",
      last_name: "Else",
      email: "samgangi@lotr.com",
      password: "different"
    }
    json = JSON.parse(response.body)

    expect(json['status']).to eq 500
  end     
end
