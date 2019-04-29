# frozen_string_literal: true

require "rails_helper"

RSpec.feature "MultiLine Post", type: :feature do
  scenario "Can submit mutli line posts and view them" do
    sign_up
    create_post(message: "Hello\nworld!")
    html = page.find('.post-content').native.to_html
    expect(html).to include("</p>\n<p>Hello\n<br>world!</p>")
  end
end