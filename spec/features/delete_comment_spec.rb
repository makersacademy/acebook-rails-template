require 'rails_helper'

RSpec.feature 'delete comment' do
  # let!(:post) { Post.create(message: 'hello') }

  scenario 'user can delete own comments' do
    sign_up
    new_post
    new_comment
    click_on 'Destroy'
    expect(page).to_not have_content('text')
  end
end
