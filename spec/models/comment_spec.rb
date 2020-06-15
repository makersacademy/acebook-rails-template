require 'rails_helper'

# RSpec.describe Comment, type: :model do
#   pending 'add some examples to (or delete) #{__FILE__}'
# end


RSpec.describe Comment, type: :model do

  describe 'Dependency' do
    it { should belong_to(:post).required }
  end

end
