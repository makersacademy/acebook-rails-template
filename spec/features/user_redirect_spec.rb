RSpec.feature "Timeline", type: :feature do

    describe 'users flow' do 

        it 'should redirect user to post page after sucessful sign up ' do 
            visit '/' ;
            click_link 'sign up' 
        end
    end
end