require 'time'

def date_format(date)
  Time.parse(date.to_s).strftime('%-d %b %Y at %k:%M')
end
