# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'friends/edit', type: :view do
  before do
    @friend = assign(:friend, Friend.create!(
                                confirmed_status: false
                              ))
  end

  it 'renders the edit friend form' do
    render

    assert_select 'form[action=?][method=?]', friend_path(@friend), 'post' do
      assert_select 'input[name=?]', 'friend[confirmed_status]'
    end
  end
end
