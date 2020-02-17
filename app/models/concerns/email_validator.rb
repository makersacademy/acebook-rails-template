class EmailValidator < ActiveModel::Validator
  def validate(user)
    user.errors.add(:email, 'Email format invaild, please enter valid email') unless format(user) || domain(user)
  end

  private

  def format(user)
    user.email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
  end

  def domain(user)
    domain = user.email.match(/(?<=@)(.+)/)[0]
    mx = Resolv::DNS.open { |dns| dns.getresources(domain, Resolv::DNS::Resource::IN::MX) }
    mx.size > 0
  end
end
