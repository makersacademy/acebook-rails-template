# frozen_string_literal: true

feature 'Show all posts on page' do
  scenario "user logs in and see's all posts" do
    sign_up
    visit('/posts')
    create_post
    expect(page).to have_content('test message')
    expect(page).to have_current_path('/posts')
  end

  scenario 'shows the date, time and user email of a post' do
    sign_up
    visit('/posts')
    test_time = Timecop.freeze(Time.now).strftime('%H:%M:%S - %d/%m/%Y')
    create_post
    Timecop.return
    expect(page).to have_content('uvalente')
    expect(page).to have_content(test_time)
  end
end
