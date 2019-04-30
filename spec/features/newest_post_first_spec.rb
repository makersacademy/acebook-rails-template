feature 'Newest posts are shown first in list' do
  scenario 'Posts are displayed in reverse chronological order' do
    visit '/'
    sign_up_helper('user@test.com', '123456')
    log_in_helper('user@test.com', '123456')
    new_post_helper("First message")
    new_post_helper("Second message")
    new_post_helper("Third message")
    new_post_helper("Fourth message")
    page.all('p').collect(&:text)
    expect(page.all('p').collect(&:text)).to have_content ["Fourth message", "Third message", "Second message", "First message"]
  end
end
