import 'dart:html';
import 'dart:math' as math;

void main(){
  oopTest();
}


void oopTest(){
   String output = "";

   Animal bear = new Animal();
   bear.name = "kungfu panda";
   bear.sound = "Grrr";
   bear._weight = 600;

   output += "${bear.name} said ${bear.sound} and weighs ${bear.weight}lbs\n";

   output += "${bear.run()}\n";

   Animal tiger = new Animal.three("Saber", "Rowr", 550);

   querySelector("#output").text = output;

   output += "${tiger.name} said ${tiger.sound} and weighs ${tiger.weight}lbs\n"; 

   output += "Number of Animals : ${Animal.getNumberOfAnimals()}\n";

   Dog rover =  new Dog.three("Rover", "Woof", 85);

   output += "${rover.name} said ${rover.sound} and weighs ${rover.weight}lbs\n";
   output += rover.info() + "\n";

   Rectangle rect = new Rectangle(5.0, 10.0);
   Circle circle = new Circle(5.0);

   output += "Rectangle Area: ${rect.area}\n Circle Area: ${circle.area}\n";

   Shape rect2 = new Rectangle(5.0, 25.0);

   output += "Rect2 Area ${(rect2 as Rectangle).area}\n";

   Superhero superman = new Superhero();

   superman.flyingDesc = "flies faster than speeding bullet";
   superman.bulletproofDesc = "bounces off";

   output += "Superman ${superman.fly()}\n";

   Car fordTruck = new Car("Ford Truck");

   output += "Ford Truck has the ID: ${fordTruck.id}\n";
  
   querySelector("#output").text = output;
}


class Animal {
	String name = "No Name";
	String sound = "No Sound";
	
	int _weight = 0;

	int get weight => _weight;

	set weight(int w){
		if(w <= 0){
			_weight = 0;
		}else{
			_weight = w;
		}
	}

	Animal(){numberOfAnimals++;}

	Animal.three(String name, String sound, int weight){
		this.name = name;
		this.sound = sound;
		this._weight = weight;
		numberOfAnimals++;
	}

	String run(){
		return "${this.name} runs";
	}

	static int numberOfAnimals = 0;

	static String getNumberOfAnimals(){
		return numberOfAnimals.toString();
	}

	String info(){
		return "$name, $sound, $weight";
	}
}

class Dog extends Animal{

  String bite(){
	return "${this.name} bit you";
  }

  Dog(){Animal.numberOfAnimals++;}

  Dog.three(String name, String sound, int weight){
	this.name = name;
	this.sound = sound;
	this._weight = weight;
	Animal.numberOfAnimals++;
 }


 String info(){
   return super .info() + " and bites";
 }
}

abstract class Shape{
  double get area;
}

class Rectangle extends Shape{

	double height, weight;

  Rectangle(this .height, this .weight);

  double get area => height * weight;
}

class Circle extends Shape{
  double radius;

  Circle(this .radius);

  double get area => math.pi * (radius * radius);
}

class Flyable{
  String fly(){return "flies";}
}

class Bulletproof{
  String hitByBullet(){ return "bullet bounce off";}
}

class Superhero implements Flyable, Bulletproof{
  String flyingDesc = "flies";
  String bulletproofDesc = "bullet bounces off";

  String fly(){ return this.flyingDesc;}
  String hitByBullet(){ return this.bulletproofDesc; }
}

class IdMaker{
    int get id => new DateTime.now().millisecondsSinceEpoch;
}

class Vehicle{
  int wheels = 4;
}

class Car extends Vehicle with IdMaker{
  String name = "no name";

  Car(String name){
    this.name = name;
  }
}

//adds on
void overloadingTest(){
  String output = "";

  Point p1 = new Point(10, 50);
  Point p2 = new Point(5, 40);

  output += "Are Points Equal : ${p1 == p2}\n";

  Point p3 = p1 + p2;

  output += "p3 X: ${p3.x} Y: ${p3.y}"

  querySelector("#output").text = output;
}

class Point{
  int x, y;
  Point(this.x, this.y);

  operator == (Point p) => this.x == p.x && this.y == p.y;
  operator + (Point p) => new Point(this.x + p.x, this.y + p.y);
}

void exceptionTest(){
  divideNums(4, 0);
}

void divideNums(int num1, int num2){
  String output = "";

  try{
	  if(num2 == 0){
	    throw new DivideByZeroError("Error";)
 	  }else{
	    output += "$num1 / $num2 = ${num1/num2}\n";
	  } on DivideByZeroError{
	    output += "Can't Divide by Zero\n";
	  }
  }

  querySelector("#output").text = output;
}

class DivideByZeroError implements Exception{
  String cause = "Can't Divide by Zero";
  DivideByZeroError(this.cause);
}