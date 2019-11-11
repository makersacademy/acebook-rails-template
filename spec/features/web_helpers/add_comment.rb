def add_comment
  fill_in 'comment_message', with: 'Test Comment'
  click_on 'Add comment'
end
