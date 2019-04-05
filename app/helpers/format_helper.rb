# Top line comment
module FormatHelper
  def linebreak(text)
    text.gsub(/\R+/, '<br/><br/>')
  end
end
