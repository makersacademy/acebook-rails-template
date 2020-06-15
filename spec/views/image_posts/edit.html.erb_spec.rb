# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'image_posts/edit', type: :view do
  before(:each) do
    @image_post = assign(:image_post, ImagePost.create!(
                                        caption: 'MyString',
                                        picture: 'MyString'
                                      ))
  end

  it 'renders the edit image_post form' do
    render

    assert_select 'form[action=?][method=?]', image_post_path(@image_post),
                  'post' do
      assert_select 'input[name=?]', 'image_post[caption]'

      assert_select 'input[name=?]', 'image_post[picture]'
    end
  end
end
