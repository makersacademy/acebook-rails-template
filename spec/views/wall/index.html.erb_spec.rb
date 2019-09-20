require 'rails_helper'

RSpec.describe 'wall/index.html.erb', type: :view do
  let(:post1) { FactoryBot.create(:post, message: 'msg 1') }
  let(:post2) { FactoryBot.create(:post, message: 'msg 2') }
  let(:post3) { FactoryBot.create(:post, message: 'msg 3') }
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }

  before(:each) { sign_in }
  # let(:post1) do
  #   double(
  #     :post,
  #     id: 1,
  #     message: '1st post',
  #     lines: ['1st post'],
  #     created_at: DateTime.now,
  #     updated_at: DateTime.now,
  #     user_id: 1
  #   )
  # end
  # let(:post2) do
  #   double(:post,
  #          id: 2,
  #          message: '2nd post',
  #          lines: ['2nd post'],
  #          created_at: DateTime.now,
  #          updated_at: DateTime.now,
  #          user_id: 1)
  # end

  it 'has a link to the new post page' do
    @current_user = FactoryBot.create(:user)
    assign(:posts, [])
    render
    expect(rendered).to have_link 'New post'
  end

  it 'shows the posts' do
    @current_user = FactoryBot.create(:user)
    assign(:posts, [post1, post2])
    render
    expect(rendered).to have_content('msg 1')
    expect(rendered).to have_content('msg 2')
  end

  it 'shows shows a delete and edit button for each post' do
    @current_user = FactoryBot.create(:user)
    assign(:posts, [post1])
    render
    expect(rendered).to have_link 'Delete'
    expect(rendered).to have_link 'Edit'
  end
end
