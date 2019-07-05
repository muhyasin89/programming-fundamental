//Constructor
function Book(title, author, year){
    // console.log('Book Initialize...');
    this.title = title;
    this.author = author;
    this.year = year;
}

//Instatiate an Object
const book1 = new Book('Book 1', 'john Doe', '2013')
const book2 = new Book('Book 2', 'jane Doe', '2016')


//make get summary a prototype
Book.prototype.getSummary = function(){
    return `${this.title} was written by 
    ${this.author} in ${this.year}`; 
}

//getAge
Book.prototype.getAge = function(){
    const years = new Date().getFullYear() - this.year;
    return `${this.title} is ${years} year old`;
}

//Revise / Change Year
Book.prototype.revise = function(newYear){
    this.year = newYear;
    this.revise = true;
}

console.log(book2);
book2.revise('2018');
console.log(book2);