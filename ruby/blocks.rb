def say_hello(&block)
    puts "Hello, world"
    if block_given?
        block.call
    else
        puts "No block was given"
    end
end

#priority one
#say_hello{puts "Hello Again"}

#priority two
say_hello do
    puts "Hello Again"
end


def header(&block)
    puts "ini wew"
    if block_given?
        name=block.call
        puts "This is inside of block #{name}"
    else
        puts "ini header bro"
    end
end

header do
    puts "This is body of blocks"
    "yasin"
    # raise "this is error"
end


#this is not working
def show_numbers(numbers=10)
    i =0
    while i < 10
        yield i
        i+=1
    end
end

show_numbers do |number|
    puts "The current number is #{number}"
    number = number *2
    puts "The current number multiply by 2 is #{number}"
end


def get_name(&block)
    print "Enter your name:"
    name=gets.chomp
    yield name
    puts "Hi,This is after name"
end

get_name do |name|
    puts "Hi, #{name}"
    neme = name.upcase
    puts "Name with upcase #{name}"
end

BEGIN {puts "this is the begining Program"}
END { puts "this is end of Program"}

#this is array
array=[1,2,3,4,5]

puts array.inspect

array.each do |number|
    puts "ini array number is current #{number}"
    number *=2
    puts "ini array number multiply is current #{number}"
end

puts array.inspect

# this is for class purpose

class Speech
    attr_reader :title

    def initialize
        print "What is name of speech?"
        @title = gets.chomp
        @lines =[]
        while add_line
            puts "Line Added"
        end
    end

    def add_line
        puts "Add line :(blank line to exit)"
        line = gets.chomp
        if line.length > 0
            @lines.push line
            return line
        else
            return nil
        end
    end


    def each(&block)
        @lines.each{ |line| yield line }
    end
end


speech = Speech.new
speech.each do |line|
    puts "this is title [#{speech.title}] #{line}"
end


#this is for second atemp

class SimpleBatchMaker
    class << self
        def go(how_many=1 , &block)
            puts "----------------- Benchmaking Started -----------------------"
            start_time =  Time.now
            puts "Start Time:\t #{start_time}\n\n"
            how_many.times do |a|
                print "."
                block.call
            end

            print "\n\n"
            end_time = Time.now
            puts "End Time: \t  #{end_time} \n"
            puts "----------------- Benchmaking finished ----------------------"
            puts "Result:\t\t #{end_time - start_time} second"
        end
    end
end

SimpleBatchMaker.go 5 do
    time =  rand(0.1..1.0)
    sleep time
end
