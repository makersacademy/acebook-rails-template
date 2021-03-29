feature 'showing posts attributes' do
  scenario 'post shows user it was created by' do
   sign_up_as_testy
   click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_selector(".name", text: "Testy Testerson")
  end
end