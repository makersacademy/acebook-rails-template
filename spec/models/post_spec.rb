require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  describe '#by_user?' do
    let(:session_user) { double :session_user, id: 1 }

    it 'returns true if post is by signed in user' do
      # adds user to user table so we can use foreign key in test
      User.create(id: 1, name: 'Test Name', email: 'signin_test@example.com', password: '123456') 
      # create post using foreign key
      post = Post.create(message: "test1", user_id: 1)    
      expect(post.by_user?(session_user)).to eq true
    end

    it 'returns false if post is by another user' do
      # adds user to user table so we can use foreign key in test
      User.create(id: 2, name: 'Test Name', email: 'signin_test@example.com', password: '123456')
      # create post using foreign key
      post = Post.create(message: "test2", user_id: 2)    
      expect(post.by_user?(session_user)).to eq false
    end

    describe '#within_time?' do
      before do
        @post = described_class.create(message: "test")
      end
      
      it 'returns true if posted less than 10 minutes ago' do
        expect(@post.within_time?(10)).to eq true
      end

      it 'returns false if posted more than 10 minutes ago' do
        Timecop.freeze(Time.current + 660) do
          expect(@post.within_time?(10)).to eq false
        end
      end
        

    end  
  end
end
