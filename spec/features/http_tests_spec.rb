require 'spec_helper'
describe "registrations" do
    it "should return a json created" do
 
      begin
        response = TestParty.post('/api/v1/registrations?email=rrdf@a.com&first_name=a&last_name=a&password=password')
      rescue HTTParty::RedirectionTooDeep => redirection  #strange, but prescribed approach
        redirection.response.code.should == "302"
        redirection.response.header["Location"].should == ""
      end
      result = JSON.parse(response.body)
      expect(result['status']).to eq('created')
    end
  end