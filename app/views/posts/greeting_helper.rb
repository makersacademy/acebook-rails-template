AFTERNOON = 12

def current_Hour
  if Time.new.hour < AFTERNOON
    return "Good morning"
  else
    return "Good afternoon"
  end
end
