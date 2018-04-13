require 'rails_helper'

describe Posted do

  subject(:Posted) { described_class.new('fake_time') }

  seconds_in_a_minute = Posted::SECONDS_IN_A_MINUTE
  seconds_in_an_hour = Posted::SECONDS_IN_A_HOUR
  seconds_in_a_day = Posted::SECONDS_IN_A_DAY
  seconds_in_a_week = Posted::SECONDS_IN_A_WEEK
  seconds_in_a_year = Posted::SECONDS_IN_A_YEAR


  describe 'string' do

    context 'Stubbed time(singular)' do

      it 'returns a string for seconds' do
        allow(subject).to receive(:calculator).and_return(1)
        expect(subject.string).to eq('Posted 1 second ago')
      end

      it 'returns a string for minutes' do
        allow(subject).to receive(:calculator).and_return(seconds_in_a_minute + 1)
        expect(subject.string).to eq('Posted 1 minute ago')
      end

      it 'returns a string for hours' do
        allow(subject).to receive(:calculator).and_return(seconds_in_an_hour + 1)
        expect(subject.string).to eq('Posted 1 hour ago')
      end

      it 'returns a string for days' do
        allow(subject).to receive(:calculator).and_return(seconds_in_a_day + 1)
        expect(subject.string).to eq('Posted 1 day ago')
      end

      it 'returns a string for weeks' do
        allow(subject).to receive(:calculator).and_return(seconds_in_a_week + 1)
        expect(subject.string).to eq('Posted 1 week ago')
      end

      it 'returns a string for years' do
        allow(subject).to receive(:calculator).and_return(seconds_in_a_year + 1)
        expect(subject.string).to eq('Posted 1 year ago')
      end
    end
    context 'Stubbed time(plural)' do

      it 'returns a string for seconds' do
        allow(subject).to receive(:calculator).and_return(2)
        expect(subject.string).to eq('Posted 2 seconds ago')
      end

      it 'returns a string for minutes' do
        allow(subject).to receive(:calculator).and_return(2 * (seconds_in_a_minute))
        expect(subject.string).to eq('Posted 2 minutes ago')
      end

      it 'returns a string for hours' do
        allow(subject).to receive(:calculator).and_return(2 * (seconds_in_an_hour))
        expect(subject.string).to eq('Posted 2 hours ago')
      end

      it 'returns a string for days' do
        allow(subject).to receive(:calculator).and_return(2 * (seconds_in_a_day))
        expect(subject.string).to eq('Posted 2 days ago')
      end

      it 'returns a string for weeks' do
        allow(subject).to receive(:calculator).and_return(2 * (seconds_in_a_week))
        expect(subject.string).to eq('Posted 2 weeks ago')
      end

      it 'returns a string for years' do
        allow(subject).to receive(:calculator).and_return(2 * (seconds_in_a_year))
        expect(subject.string).to eq('Posted 2 years ago')
      end
    end
  end
end
