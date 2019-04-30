require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it "converts a date from db into 'dd/mm/yyyy hh:mm' format" do
    time = Time.new(2019, 04, 29, 2, 2, 2)
    expect(Post.format_time(time)).to eq("29/04/2019 02:02")
  end
end
