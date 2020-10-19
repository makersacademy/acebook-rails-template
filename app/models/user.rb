class User < ApplicationRecord

  def initialize(email: , password:, first_name:, last_name:)
    @email = email
    @password = password
    @first_name = first_name
    @last_name = last_name
  end

end
