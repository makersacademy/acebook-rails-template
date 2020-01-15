require_relative '../helpers/web_helpers'

RSpec.feature "Post order", type: :feature do
  scenario "Posts should be shown in a reverse chronological order" do
    sign_up('Harry', 'Mumford', 'harry_mumford@hotmail.co.uk', 'password123')
    new_post('First post')

    sleep(1)

    new_post('Second post')

    expect(page.body.index('First post')).to be > page.body.index('Second post')
  end
end
