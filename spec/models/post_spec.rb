require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  describe '#by_user?' do
    it 'returns true if post is by signed in user' do
      session_user = double(session_user, id: 1)

      Post.create(message: "Can't update test")    
      expect(subject.by_user?(session_user)).to eq true
    end
  end
end
