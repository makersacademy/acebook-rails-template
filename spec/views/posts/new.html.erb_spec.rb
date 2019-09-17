require 'rails_helper'

RSpec.describe 'posts/new.html.erb', type: :view do
  it 'has field to add message and able to save' do
    render
    expect(rendered).to have_tag('form', with: { action: '/posts', method: 'post' }) do
      with_tag 'textarea'
    end
    expect(rendered).to have_button 'Submit'
  end
end
