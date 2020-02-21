# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'friends/show', type: :view do
  before do
    @friend = assign(:friend, Friend.create!(
                                confirmed_status: false
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/false/)
  end
end
