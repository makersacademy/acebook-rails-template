feature 'wall' do
  before do
    sign_up
    log_out
    sign_up_as_second_user
    click_link 'Users'
    click_link 'Amy Smith'
    create_wall_post
  end
end
