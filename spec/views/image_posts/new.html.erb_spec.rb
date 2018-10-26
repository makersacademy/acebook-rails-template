# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'image_posts/new', type: :view do
  before(:each) do
    assign(:image_post, ImagePost.new(
                          caption: 'MyString',
                          picture: 'MyString'
                        ))
  end

  it 'renders new image_post form' do
    render

    assert_select 'form[action=?][method=?]', image_posts_path, 'post' do
      assert_select 'input[name=?]', 'image_post[caption]'

      assert_select 'input[name=?]', 'image_post[picture]'
    end
  end
end
