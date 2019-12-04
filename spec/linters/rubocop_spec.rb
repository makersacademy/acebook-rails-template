require 'spec_helper'

RSpec.describe 'rubocop analysis' do
  subject(:report) { `rubocop` }

  xit 'has no offences' do
    expect(report).to match(/no\ offences\ detected/)
  end
end
