if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_acebook_november2019", domain: "acebook-november2019.herokuapp.com/"
else
  Rails.application.config.session_store :cookie_store, key: "_acebook_november2019"
end