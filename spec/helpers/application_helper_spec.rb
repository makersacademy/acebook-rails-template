require 'rails_helper'

RSpec.describe ApplicationHelper do

  class MockClass
    include ApplicationHelper
  end

  mc = MockClass.new
  date_time = Time.parse("2018-07-01 12:00:00 UTC")

  it 'converts server time to string' do
    expect(mc.convert_time(date_time)).to eq("July  1, 2018 at 12:00 PM")

  end
end
