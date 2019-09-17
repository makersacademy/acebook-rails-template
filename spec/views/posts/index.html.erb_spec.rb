require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
  let(:post1) do
    double(
      :post,
      id: 1,
      message: '1st post',
      lines: ['1st post'],
      can_edit?: true,
      created_at: DateTime.now,
      updated_at: DateTime.now,
      user_id: 1
    )
  end
  let(:post2) do
    double(
      :post,
      id: 2,
      message: '2nd post',
      lines: ['2nd post'],
      can_edit?: true,
      created_at: DateTime.now,
      updated_at: DateTime.now,
      user_id: 1
    )
  end
  it 'has a link to the new post page' do
    assign(:posts, [])
    render
    expect(rendered).to have_link 'New post'
  end

  it 'shows the posts' do
    assign(:posts, [post1, post2])
    render
    expect(rendered).to match(/1st post/)
    expect(rendered).to match(/2nd post/)
  end

  it 'shows shows a delete and edit button for each post' do
    assign(:posts, [post1])
    render
    expect(rendered).to have_link 'Delete'
    expect(rendered).to have_link 'Edit'
  end
end
