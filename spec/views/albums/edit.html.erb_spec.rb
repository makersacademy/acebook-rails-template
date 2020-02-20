# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'albums/edit', type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
                              title: 'MyString'
                            ))
  end

  it 'renders the edit album form' do
    render

    assert_select 'form[action=?][method=?]', album_path(@album), 'post' do
      assert_select 'input[name=?]', 'album[title]'
    end
  end
end
