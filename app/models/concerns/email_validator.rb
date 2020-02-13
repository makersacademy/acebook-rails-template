class EmailValidator < ActiveModel::Validator
  def validate(user)
    return if format(user)
    domain(user)
  end

  private

  def format(user)
    ok = user.email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
    return user.errors.add(:email, 'is invalid - format error') unless ok
  end

  def domain(user)
    domain = user.email.match(/(?<=@)(.+)/)[0]
    mx = Resolv::DNS.open { |dns| dns.getresources(domain, Resolv::DNS::Resource::IN::MX) }
    ok = mx.size > 0
    user.errors.add(:email, 'is invalid - domain error') unless ok
  end
end
