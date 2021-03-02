feature 'liking posts' do

  before do
    sign_up(email: 'test@test.com', password: 'password')
    create_a_new_post_and_see_it_on_the_feed('Great post')
  end

  scenario 'number of likes starts at 0' do
    expect(first('.post')).to have_content '0 Likes'
  end

  context 'when you click like button' do
    before do
      click_on(class: 'like-btn')
    end
    scenario 'number of likes increments by 1' do
      expect(first('.post')).to have_content '1 Like'
    end

    scenario 'the like button is no longer shown' do
      expect(first('.post')).to have_no_css('.like-btn')
    end

    scenario 'the unlike button is shown' do
      expect(first('.post')).to have_css('.unlike-btn')
    end

  end

  context 'when you click unlike' do
    before do
      first('.post').click_on(class: 'like-btn')
      first('.post').click_on(class: 'unlike-btn')
    end

    scenario 'number of likes decreases by 1' do
      expect(first('.post')).to have_content '0 Likes'
    end

    scenario 'the unlike button is no longer shown' do
      expect(first('.post')).to have_no_css('.unlike-btn')
    end

  end

  context 'when you have already liked a post' do
    scenario "get a warning to show you can't like again" do
      allow_any_instance_of(LikesController).to receive(:already_liked?) { true }
      first('.post').click_on(class: 'like-btn')
      expect(page).to have_content("Yo, stop liking this")
    end
  end

  context 'when you have not already liked a post' do
    scenario "get a warning to show you can't unlike" do
      first('.post').click_on(class: 'like-btn')
      allow_any_instance_of(LikesController).to receive(:already_liked?) { false }
      first('.post').click_on(class: 'unlike-btn')
      expect(page).to have_content("Can't unlike")
    end
  end

end
