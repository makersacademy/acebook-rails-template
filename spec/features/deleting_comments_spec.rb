feature 'user can delete comments' do
  scenario 'from the timeline' do
    sign_up
    create_post
    click_link 'Home'
    create_comment
    click_link 'Delete comment'
    expect(page).not_to have_content('test comment')
  end

  scenario 'from the user homepage' do
    sign_up
    create_post
    create_comment
    click_link 'Delete comment'
    expect(page).not_to have_content('test comment')
  end
end
