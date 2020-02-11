feature 'checks whether we are able to view the homepage' do 
  scenario 'homepage' do 
    visit('/')
    expect(page).to have_content('Welcome to Acebook')
  end
end 