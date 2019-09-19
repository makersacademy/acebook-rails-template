require 'rails_helper'

RSpec.describe 'posts/edit.html.erb', type: :view do
  it 'has a message field and a submit link' do
    @post = FactoryBot.create(:post)
    render
    expect(rendered).to have_field('post[message]')
    expect(rendered).to have_button('Submit')
  end
end
