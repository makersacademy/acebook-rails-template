module FormatHelper

  def linebreak(text)
    text.to_s.gsub(/\n/, '<br/>')
  end

end
