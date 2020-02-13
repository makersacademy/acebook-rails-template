class EmailDomainValidator < ActiveModel::Validator
  def validate(user)
    domain = user.email.match(/(?<=@)(.+)/)[0]
    mx = Resolv::DNS.open { |dns| dns.getresources(domain,  Resolv::DNS::Resource::IN::MX) }
    ok = mx.size > 0
    unless ok
      user.errors.add(:email, 'is invalid - domain error')
    end
  end
end