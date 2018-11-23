require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  describe "timeformat" do
    it "formats date and time nicely!" do

      expect(Post.dateformat('2018-11-22 11:16:02 UTC ')).to eq '22 Nov 2018 at 11:16'
    end
  end
end
