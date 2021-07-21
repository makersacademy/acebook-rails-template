module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user)
    p gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    p gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
