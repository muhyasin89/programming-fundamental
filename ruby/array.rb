#this is test array
test=Array.new;
test.push(1)

test << 2
test << "hello boy"

puts "ini ada index paling akhir: #{test.pop} "

test+=[4]

puts "panjang array #{test.length} "
p test
print "or"
puts test.inspect

# the next is about sort
puts "=== | this section about sort |====="

test+=[9,8,7,1,5,6]

puts test.sort.inspect

puts test.sort{|a,b| a <=> b}.inspect
puts test.sort{|a,b| b <=> a}.inspect

puts test.sort.reverse.inspect

puts test.uniq.inspect


test.each do |item|
    puts "I'am an array #{item}"
end

if(test.all? {|item| item > 3} == true)
    puts "ada array yang lebih besar dari 3"
else
    puts "ngk ada array yang lebih besar dari 3"
    if(test.any?{|item| item > 3})
        puts " ini true:"+test.select{|item| item > 3}.inspect
    else
        puts "ini false:"+test.reject{|item| item > 3}.inspect
    end
end
