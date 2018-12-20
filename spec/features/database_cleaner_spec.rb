require 'rails_helper'
require_relative '../support/feature_web_helpers'
require_relative '../support/capybara_selectors'

describe "db_cleaner" do

    it "first test" do
      signup
      expect(User.all.count).to eq(1)
      expect(User.last.id).to eq(1)
    end

    it "should clean db" do
      signup
      expect(User.all.count).to eq(1)
      expect(User.last.id).to eq(1)
    end

end
