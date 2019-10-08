module LineBreaks
def line_breaks(string)
  string = 'test'
  new_string = string.gsub('e', 'a')
  # new_string = string.gsub(' ', '&amp;nbsp;')
  # new_string = new_string.gsub('\n', '<<b></b>br>')
  return new_string
end
end
