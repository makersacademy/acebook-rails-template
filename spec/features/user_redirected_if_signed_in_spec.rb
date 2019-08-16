require_relative './sign_up_helper'


feature 'User is redirected away from irrelevant pages if logged' do
  scenario 'User redirected if they go to the log in page if they'\
            'they are already logged in' do
            registration
            visit sessions_new_url
            expect(page).to have_content('you are already logged in')
  end

  scenario 'User redirected if they go to the log in page if they'\
            'they are already logged in' do
            registration
            visit ('/users/new')
            expect(page).to have_content('you already have an account')
  end
end
