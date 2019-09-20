require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
  let(:post1) { FactoryBot.create(:post, message: 'msg 1') }
  let(:post2) { FactoryBot.create(:post, message: 'msg 2') }
  let(:post3) { FactoryBot.create(:post, message: 'msg 3') }
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }
  # let(:post1) do
  #   double(
  #     :post,
  #     id: 1,
  #     message: '1st post',
  #     lines: ['1st post'],
  #     can_edit?: true,
  #     created_at: DateTime.now,
  #     updated_at: DateTime.now,
  #     user_id: 1
  #   )
  # end
  #
  # let(:post2) do
  #   double(
  #     :post,
  #     id: 2,
  #     message: '2nd post',
  #     lines: ['2nd post'],
  #     can_edit?: true,
  #     created_at: DateTime.now,
  #     updated_at: DateTime.now,
  #     user_id: 1
  #   )
  # end
  #
  # let(:post3) do
  #   double(
  #     :post,
  #     id: 3,
  #     message: '2nd post',
  #     lines: ['2nd post'],
  #     can_edit?: true,
  #     created_at: DateTime.now,
  #     updated_at: DateTime.now,
  #     user_id: 1
  #   )
  # end

  # let(:user1) { double(:user, id: 1) }
  # let(:user2) { double(:user, id: 2) }
  before(:each) { sign_in }

  it 'has a link to the new post page' do
    @current_user = FactoryBot.create(:user)
    puts "DEBUG: IN SPEC: #{@current_user.id}"
    assign(:posts, [])
    render
    expect(rendered).to have_link 'New post'
  end

  it 'shows the posts' do
    @current_user = FactoryBot.create(:user)
    assign(:posts, [post1, post2])
    assign(:user, user1)
    render
    # expect(rendered).to match(/1st post/)
    # expect(rendered).to match(/2nd post/)
    expect(rendered).to have_content('msg 1')
    expect(rendered).to have_content('msg 2')
  end

  it 'shows shows a delete and edit button for each post' do
    @current_user = FactoryBot.create(:user)
    post1 = FactoryBot.create(:post, user_id: @current_user.id)
    assign(:posts, [post1])
    assign(:user, @current_user)
    render
    expect(rendered).to have_link 'Delete'
    expect(rendered).to have_link 'Edit'
  end

  it "doesn't show a delete button for posts not own by current user" do
    @current_user = FactoryBot.create(:user)
    assign(:posts, [post1])
    assign(:user, @current_user)
    render
    expect(rendered).not_to have_link 'Delete'
    expect(rendered).to have_link 'Edit'
  end
end
