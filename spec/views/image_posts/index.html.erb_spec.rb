# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'image_posts/index', type: :view do
  before(:each) do
    assign(:image_posts, [
             ImagePost.create!(
               caption: 'Caption',
               picture: 'Picture'
             ),
             ImagePost.create!(
               caption: 'Caption',
               picture: 'Picture'
             )
           ])
  end

  it 'renders a list of image_posts' do
    render
    assert_select 'tr>td', text: 'Caption'.to_s, count: 2
  end
end
