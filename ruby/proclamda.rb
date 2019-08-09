# see the differce between lambda and proc here http://awaxman11.github.io/blog/2013/08/05/what-is-the-difference-between-a-block/
# definition of proc https://docs.ruby-lang.org/en/2.0.0/Proc.html
# explanation if lambda http://stackoverflow.com/questions/6343812/calling-applying-lambda-vs-function-call-the-syntax-in-ruby-is-different-why

#proc =Proc.new #this is error because it didnt give block

proc =Proc.new { puts "Hello world"} #or using #proc =proc { puts "Hello world"}

proc.call

my_lambda = ->{puts "this is lambda"} #or using #my_lambda = lambda {puts "this is lambda"}
my_lambda[]

proc =Proc.new{ |name| puts "Hello, #{name}"}
proc.call("yasin") #or using #proc.call "yasin"
#note using proc can take overload argument, the rest will be ignored

my_lambda =lambda{|name| puts "Hello, #{name}"} #cannot use #my_lambda = ->{|name| puts "Hello, #{name}"}
my_lambda.call "jason" #or using #my_lambda["jason"]


# check proc and lambda using def

def return_from_proc
    variable = proc {return "from inside proc"}
    variable.call
    return "this is the end of proc"
end

def return_from_lambda
    variable = lambda {return "from inside lambda"}
    variable.call
    return "this is from the end of lambda"
end

puts return_from_proc
puts return_from_lambda

#check proc and lambda using calling
class Paper
    def initialize(&block)
        yield self if block_given?
    end

    def set_variable
        return Proc.new do |kind,val|
            [kind,val].join(": ")
        end
    end

    def title(value)
        @title=set_variable.call "TITLE",value
    end

    def heading(value)
        @heading = set_variable.call "HEADING",value
    end

    def body(value)
        @body = set_variable.call "BODY",value
    end

    def display
        puts "-------------------------"
        puts @title
        puts "-------------------------"
        puts @heading
        puts "-------------------------"
        puts @body
        puts "-------------------------"
    end
end

paper = Paper.new do |p|
            p.title "this is title"
            p.heading "this is heading"
            p.body "the entire content of my paper"
        end

paper.display
