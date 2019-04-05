require 'rails_helper'

RSpec.describe FormatHelper, type: :helper do
  describe "#linebreak" do
    it "substitutes a <br> for a newline" do
      message = "Here is a message \n with a new line in it"
      breaks = "Here is a message <br/><br/> with a new line in it"
      expect(helper.linebreak(message)).to eq(breaks)
    end
  end
end
