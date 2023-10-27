def Foo(a, b, c, x)
  if(x < 0 and b != 0)
    return a-(x/(10+b))
  elsif  (x > 0 and b == 0)
    return (x-a)/(x-c)
  else
    return 3*x+2/c
  end
end

puts "Foo(2, 5, -1, 4) = #{Foo(2, 5, -1, 4)}"
puts "Foo(13) = #{Foo(2,0,1,4)}"
puts "Foo(13) = #{Foo(2,1,1,4)}"