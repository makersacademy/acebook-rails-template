feature 'showing posts attributes' do
  scenario 'post shows user it was created by' do
   sign_up_as_testy
   click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect('.post').to have_content ('Testy Testerson')
  end
end