
def pair_generator
  names = ["Veronica", "Farhaan", "Courtenay", "Ollie", "Sam"]
  two = []
  three = []

  while two.length < 2
    name = names.sample
    if two[0] != name && two[1] != name
      two << name
    end
  end

  while three.length < 3
    name = names.sample

    if two[0] != name && two[1] != name && three[0] != name && three[1] != name
      three << name
    end
  end

  puts "The pair today is #{two[0]} and #{two[1]}."
  puts "The three is #{three[0]}, #{three[1]} and #{three[2]}."
  puts "The stand-up / retro leader is #{names.sample}."

end

pair_generator
