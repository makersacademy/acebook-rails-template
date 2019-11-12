require 'rails_helper'

RSpec.describe Comment, type: :model do

  comment = Comment.create

  it { is_expected.to be }

  describe '#can_destroy?' do
    it 'returns true if a comment can be destroyed' do
      expect(comment.can_destroy?).to eq comment
    end
  end

  # COULD add test for not_editable? once check on post one 
end
