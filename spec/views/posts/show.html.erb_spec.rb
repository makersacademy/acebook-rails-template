# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'posts/show', type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
                            message: 'Message'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Message/)
  end
end
