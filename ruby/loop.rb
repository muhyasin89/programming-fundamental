for animal in %w(dog cat horse snake goat)do
    break if animal == "snake"
    puts "the current animal is #{animal}"
end

animals = %w(dog cat horse snake goat)
count = 0

#https://teamtreehouse.com/community/invalid-retry-and-compile-error-syntaxerror

# for hewan in animals
#     puts "the curret animal is #{hewan}"
#     break if count == 10
#     count +=1
#     retry if hewan == 'snake'
# end

for hewan in animals
    puts "the curret animal is #{hewan}"
    break if count == 10
    count +=1
    redo if hewan == 'snake'
end

begin
    animals.each do |hewan|
        puts "The current animal is #{hewan}"
        break if count == 10
        count += 1
        raise if hewan == 'horse'
    end
rescue
    retry
end

name =''

loop do
    print "Enter your name:"
    name=gets.chomp
    if(name == 'yasin')
        puts "Hi #{name}, we have been waiting for you"
        break
    end
end
