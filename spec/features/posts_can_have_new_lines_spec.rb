# frozen_string_literal: true

feature 'Posts can have new lines' do
  scenario 'Posts with new lines are displayed' do
    visit '/'
    sign_up_helper('user@test.com', '123456')
    log_in_helper('user@test.com', '123456')
    new_post_helper("First message\nwith a new line")
    expect(all('p')[0].native.inner_html).to eq "First message\n<br>with a new line"
  end
end
