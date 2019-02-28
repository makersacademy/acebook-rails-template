RSpec.feature 'Posts page' do
  scenario 'The posts include their date' do
    log_in
    expect(page).to have_selector("ul#posts li:nth-child(1)", text: "2019")
  end
end
