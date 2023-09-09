# frozen_string_literal: true
def volume(x,j)
  a=Math.cos(24*(Math::PI/2))
  b=Math.tan(Math.log(x**3).abs)**5+4.2*10**(-2.8)
  c=Math.sqrt((x+Math::E**j).abs)
  v=a+b/c
  return v
end

print "Введіть значення x: "
x = gets.chomp.to_f

print "Введіть значення j: "
j = gets.chomp.to_f
result = volume(x,j)
puts "Результат обчислення: #{result}"