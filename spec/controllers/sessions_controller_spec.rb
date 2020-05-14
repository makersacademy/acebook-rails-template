require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do

  before(:each) do
    @user = User.create(
    first_name: "Sam",
    last_name: "Gangi",
    email: "samgangi@lotr.com",
    password: "theshire"
    )
  end

  it "POST /sessions correct credentials, responds with json status 200 and user details " do
    post :create, params: { 
      email: "samgangi@lotr.com",
      password: "theshire"
    }
    json = JSON.parse(response.body)

    expect(json['status']).to eq "created"
    expect(json['user']['email']).to eq @user.email
    expect(json['user']['first_name']).to eq @user.first_name
    expect(json['user']['last_name']).to eq @user.last_name
    expect(json['user']['id']).to eq @user.id
    expect(json['logged_in']).to eq true
  end     

  it "POST /sessions incorrect email, responds with json status 401 " do
    post :create, params: { 
      email: "INCORRECT@lotr.com",
      password: "theshire"
    }
    json = JSON.parse(response.body)

    expect(json['status']).to eq 401
  end

  it "POST /sessions incorrect password, responds with json status 401 " do
    post :create, params: { 
      email: "samgangi@lotr.com",
      password: "INCORRECT"
    }
    json = JSON.parse(response.body)

    expect(json['status']).to eq 401
  end     
end
