RSpec.feature 'Posts page' do
  scenario 'The posts include their date' do
    log_in_and_go_to_posts
    expect(page).to have_selector("ul#posts li:nth-child(1)", text: "02:51PM - 28 Feb 2019")
  end
end
