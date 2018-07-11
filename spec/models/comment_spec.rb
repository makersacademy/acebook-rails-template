require 'rails_helper'

RSpec.describe Comment, type: :model do

  it 'raises error when no user_id or post_id' do
    comment = Comment.new

    expect(comment).not_to be_valid
  end

end
