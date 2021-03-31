require 'rails_helper'

feature "User pages" do
  subject { page }
  scenario "should include signup page" do
    visit signup_path
    expect(page).to have_selector('h1',    text: 'Sign up')
  end

  feature 'signup' do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    feature 'with invalid information' do
      scenario 'no info given' do
        visit signup_path
        expect { click_button "Create my account" }.not_to change(User, :count)
      end

    end

    feature 'with valid information' do
        before do
            fill_in "Name", with: "Lizard Lizardson"
            fill_in "Email", with: "totally_lizard@example.com"
            fill_in "Password", with: "lizzalizz"
            fill_in "Confirmation", with: "lizzalizz"
        end

        scenario 'should create a user' do
            expect { click_button submit }.to change { User.count }.by(1)
            expect(page).to have_content("Welcome to Acebook, fellow lizard")
        end
    end

  end
end
