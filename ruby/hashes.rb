require 'json'
require 'awesome_print'

file=File.read('area.json')
hash_test= JSON.parse(file)

ap hash_test

h= Hash.new{|hash, key| hash[key] = "Default of hash is #{key}"}

puts "====| this is keys |====="
puts hash_test.keys.inspect


if( hash_test.has_key?('Tebo'))
    puts "Tebo : true"
else
    puts "Tebo : false"
end

if( hash_test.member? ('jambi'))
    puts "Jambi : true"
else
    puts "Jambi : false"
end

puts "====| this is values |====="
puts hash_test.values.inspect

if( hash_test.has_value?('Tebo'))
    puts "Tebo : true"
else
    puts "Tebo : false"
end

if( hash_test.values_at('128'))
    puts "#{hash_test.values_at('128')} : true"
    puts "#{hash_test.values_at('61','63','64')} : true"
else
    puts "#{hash_test.values_at('128')} : false"
end


hash_test.each do|key,value|
    print "this is each do #{key} and #{value} ,"
end

hash_test.each_pair {|key,value| print "this is using pair #{key} : #{value} ,"}

hash_test.each_key {|key| print "this is the key: #{key} ,"}

hash_test.each_value{|value| print "this is the value: #{value} ,"}

puts "\n"+hash_test.select{|key,value| key == '132'}.inspect
puts hash_test.select!{|key,value| key == '132'}.inspect
puts hash_test.keep_if{|key,value| key == '132'}.inspect
puts hash_test.find{|key,value| key == '132'}.inspect
puts hash_test.find_all{|key,value| value.match('a')}.inspect

puts hash_test.all?{|key,value| value.match('a')}.inspect
puts hash_test.any?{|key,value| value.match('a')}.inspect
puts hash_test.map{|key,value| value="(ruby test) is #{value}"}.inspect

puts hash_test.reject{|key,value| value.match('a')}
