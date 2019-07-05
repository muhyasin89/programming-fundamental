import 'dart:html';
import 'dart:math';

void main(){
  // querySelector("#button").onClick.listen(getSum);

  // varTest();

  // mathTest();

  // condTest();

  // stringTest();

  //dataForTest();

  // MapTest();

  manipulateHTML();
}

void getSum(MouseEvent event){
  int num1 = int.parse((querySelector("#num1") as InputElement).value);
  int num2 = int.parse((querySelector("#num2") as InputElement).value);

  var sum = (num1+num2).toString();

  querySelector("#sum").text = "$num1 + $num2 = $sum";
}

void varTest(){
  // String randString = "Random String";

  // bool canVote = true;

  // int maxInt = 9007199254740992;

  // double piVal = 3.141592653589793;

  // querySelector("#output").text = "Max int : ${maxInt + 1} \n P1: ${piVal + 0.000000000001}";

  List randList = [1,2,3,4,5];
  
  Map randMap = {1 : "Tpm Smith", 2 : "Bejo"};

}


void mathTest(){
  var random = new Random();
  var number = 6.45;

  // random.nextInt(100)
  querySelector("#output").text = "5.0 + 4.0 = ${5.0 + 4.0}\n 5.0-4.0 = ${5.0 - 4.0}\n 5.0 * 4.0 = ${5.0 * 4.0}\n 5.0 / 4.0 = ${5.0 / 4.0}\n 5.0 * 4.0 =${5.0 * 4.0}\n 5.0 % 4.0 = ${5.0 % 4.0}\n e^3 = ${exp(3)}\n log(1000) = ${log(1000)}\n max(10,5) = ${max(10,5)}\n min(10,5) = ${min(10,5)}\n 10^5 = ${pow(10, 5)}\n sqrt(81) = ${sqrt(81)}\n round(6.45) = ${number.round()}\n Random Numbers : ${random.nextInt(100)}, ${random.nextInt(100)}, ${random.nextInt(100)}\n";
}

void condTest(){
  String output = "";

  var age = 13;
  if((age >= 5) && (age <= 6)){
    output = "Go to Kindergarten"; 
  } else if(age > 18){
    output = "Go to collage\n";
  } else {
    output = "Go to Grade ${age - 5}\n";
  }

  output += "!(true) = ${!true}\n";
  output += "true || false = ${(true || false)}\n";


  String superhero = "Superman";

  switch(superhero){
    case "Batman":
      output += "Batman is Bruce Wayne\n";
      break;

    case "Superman":
        output += "Superman is Clark Kent\n";
        break;

    default:
      output += "Hero isn't in database\n"; 
  }

  querySelector("#output").text = output; 
}


void stringTest(){
	String output = "";
	String randString = "I" + "am a long " + "string";
  String randString2 = "Other random string";

	output += "0 Index : ${randString[0]}\n";

	output += "String Equal ${randString.compareTo(randString2)}\n";

	output += "Word long in string : ${randString.contains("long", 0)}\n";

	output += "Index of long : ${randString.indexOf("long")}\n";

	output += "Replace spaces : ${randString.replaceAll(" ", ", ")}";

	List ListWords = randString.split(" ");

	output += "String Length : ${randString.length}\n";

	output += "Index 0 - 4 : ${randString.substring(0, 4)}\n";

	output += "UpperCase: ${randString.toUpperCase()}\n";

	output += "Lowercase : ${randString.toLowerCase()}\n";

	randString = randString.trim();

	output += "Is Empty : ${randString.isEmpty}\n";

	querySelector("#output").text = output;
}


void dataForTest(){
	String output = "";
	
	// List emptyList = [];

	List randList = ["Derek", 40, 175.5];

	for(int i=0; i < randList.length; i++){
		output += randList[i].toString() + ", ";	
	}

	output += "\n";

	randList.add("Pittsburgh");

	randList.remove(175.5);

	randList.forEach((val) => output += "List Item : ${val}\n");

	// for(String val in randList){
	// 	output += val.toString() + ", ";
	// }

	output += "\n";

	// List<String> friends = ["Bob", "Tom"];

	querySelector("#output").text = output;
}


void MapTest(){
	String output = "";

	//Map emptyMap = {};

	Map stateCapitals = {"Alabama" : "Montgomery", "Alaska": "Juneau"};

	Map customers = {100 : {"name": "Paul Smith", "Balance" : 120.25}};

	output += "The capital of Alabama is ${stateCapitals["Alabama"]}\n";

	output += "Paul Smiths balance is ${customers[100]["Balance"]}\n";

	stateCapitals.remove("Alaska");

	stateCapitals.addAll({"Arizona" : "Phoenix" });

	stateCapitals.forEach((k, v) => output += "$k : $v\n");

	querySelector("#output").text = output;
}

void manipulateHTML(){
  String output = "";

  Element title = querySelector("#sum");

  title.setInnerHtml("Take me to your leader");

  title.style.color = "Blue";

  title.classes.add("titleStyle");

  output += title.innerHtml + "\n";

  querySelector("#output").text = output;

  Element divBox = querySelector("#divBox");

  DivElement sampDiv =  new DivElement();

  sampDiv.text = "I'm a DIV";
  divBox.children.add(sampDiv);

  AnchorElement sampAnchor = new AnchorElement();
  sampAnchor.text = "Google";

  sampAnchor.setAttribute("href", "http://google.com");
  sampAnchor.appendText("is here");

  output += "href of link ${sampAnchor.getAttribute("href")}\n";

  divBox.children.add(sampAnchor);
  divBox.children.add(new Element.tag('br'));

  Element inputElement = new InputElement();

  inputElement.attributes['id'] = "inputElement";
  divBox.children.add(inputElement);

  inputElementChange(MouseEvent event) => querySelector("#output").text = output + "Input Changed\n";

  //querySelector("#inputElement").onChange.listen(inputElementChange);

}
