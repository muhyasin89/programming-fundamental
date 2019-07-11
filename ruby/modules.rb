module Test
    MODULE = "hello world"

    class Frog
        attr_accessor :name
    end
end

s= Test::MODULE
p s.to_s

mike = Test::Frog.new
mike.name =" Andy the frog"

p mike.name
puts mike.inspect

#this is for extends and include module
class Hello
    #you can using #include SayHello
    def initialize(name)
        @name = name
    end
end

module SayHello
    def say_hello
        puts "Hello, #{@name}"
    end
end

hello = Hello.new("yasin")
hello.extend SayHello
hello.say_hello

#practice 2
module SayHello
    def say_hello
        puts "Hello, #{@name}"
    end
end
class Hello
    include SayHello
    def initialize(name)
        @name = name
    end
end

puts "this is example 2"
hello = Hello.new("yasin")
hello.say_hello

#example using both include dan extends
module SayHello
    def say_hello
        puts "Hello, #{@name}"
    end

    def say_something
        puts "ini say_something"
    end
end
class Hello
    extend SayHello
    include SayHello
    def initialize(name)
        @name = name
    end
end

hello.say_something


#this is for next show how to use module in ruby
module FormatAttribute
    attr_reader :format_attribute

    def format(*attributes)
        @format_attribute = attributes
    end
end

module Formatter
    def display
        self.class.format_attribute.each do |attributes|
            puts "This is [#{attributes.to_s.upcase}] #{send(attributes)}"
        end
    end
end

class Resume
    extend FormatAttribute
    include Formatter
    attr_accessor :name, :email, :phone_number, :experience
    format :name, :email, :phone_number, :experience
end

class CV
    extend FormatAttribute
    include Formatter
    attr_accessor :name,  :experience
    format :name, :experience
end

resume =  Resume.new
resume.name ="Muhammad Yasin"
resume.email ="ini@gmail.com"
resume.phone_number = "011111"
resume.experience = "ruby"
resume.display

puts "--------------------------"

cv = CV.new
cv.name = "andy the frog"
cv.experience = "PHP, JAVASCRIPT"
cv.display
