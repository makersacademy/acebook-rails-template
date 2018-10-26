require 'rails_helper'

RSpec.describe Post, type: :model do
  Timecop.freeze(Time.zone.parse('13:00 3 October 2018'))

  subject = described_class.new do |p|
    p.created_at = Time.now
    p.message = 'Hello, world'
  end

  it { is_expected.to be }

  describe '#format_date' do
    it 'returns date and time in a user friendly way' do
      expect(subject.format_date).to eq 'Wednesday, 3 Oct 2018 at 1:00 PM'
    end
  end

  describe '#older_than_10_mins?' do
    it 'checks if a post is older than 10 mins' do
      Timecop.freeze(Time.zone.parse('13:30 3 October 2018'))
      expect(subject.older_than_10_mins?).to eq true
    end

    it 'checks if a post is older than 10 mins' do
      Timecop.freeze(Time.zone.parse('13:05 3 October 2018'))
      expect(subject.older_than_10_mins?).to eq false
    end
  end
end
