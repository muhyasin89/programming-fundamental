//Constructor
function Book(title, author, year){
    // console.log('Book Initialize...');
    this.title = title;
    this.author = author;
    this.year = year;
}


//make get summary a prototype
Book.prototype.getSummary = function(){
    return `${this.title} was written by 
    ${this.author} in ${this.year}`; 
}

//Magezine Constructor
function Magazine(title, author, year, month){
    Book.call(this, title, author, year);

    this.month = month;
}


//Inherit Prototype
Magazine.prototype =  Object.create(Book.prototype);
//Instatiate Magazine Object
const mag1 = new Magazine('Mag one', 'John Doe', '2018', 'Jan');

console.log(mag1);

console.log(mag1.getSummary())

//use Magazine Constructor
Magazine.prototype.constructor = Magazine;

console.log(mag1);

