require 'spec_helper'
describe "registrations" do
    it "should redirect to /account_created given valid data" do
      data = {
        "user[username]" => "boarse",
        "user[password]" => "Pa55word",
        "user[password_confirmation]" => "Pa55word"
      }
  
      begin
        response = TestParty.post('/registrations', :body => data)
      rescue HTTParty::RedirectionTooDeep => redirection  #strange, but prescribed approach
        redirection.response.code.should == "302"
        redirection.response.header["Location"].should == ""
      end
    end
  end