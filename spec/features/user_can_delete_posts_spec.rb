# frozen_string_literal: true

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can delete a former post' do
    sign_up(email: 'test@email.com', password: 'testpass')
    create_a_new_post_and_see_it_on_the_feed("Hello, world!")
    first('.post').click_link 'Delete'
    expect(page).not_to have_content('Hello, world!')
  end

  context 'when someone else has made a post' do
    before do
      sign_up(email: 'user1@email.com', password: 'testpass')
      create_a_new_post_and_see_it_on_the_feed("Hello, world!")
      click_link 'Sign out'
      sign_up(email: 'user2@email.com', password: 'testpass')
      visit '/posts'
    end

    scenario 'User can not see edit on others post' do
      expect(first('.post')).not_to have_link('Edit')
    end

    scenario 'User can not see delete on others post' do
      expect(first('.post')).not_to have_link('Delete')
    end

    scenario "User is warned when trying to edit another's post" do
      visit '/posts/1/edit'
      expect(page).to have_current_path('/posts')
      expect(page).to have_content("Not authorised!")
    end

  end
end
