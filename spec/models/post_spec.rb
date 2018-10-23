require 'rails_helper'

RSpec.describe Post, type: :model do

  Timecop.freeze(Time.zone.parse('13:00 3 October 2018'))

  subject = described_class.new do |p|
    p.created_at = Time.now
    p.message = "Hello, world"
  end

  it { is_expected.to be }

  describe '#format_date' do
    it "returns date and time in a user friendly way" do
      expect(subject.format_date).to eq "Wednesday, 3 Oct 2018 at 1:00 PM"
    end
  end
end
