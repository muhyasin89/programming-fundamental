//Constructor
function Book(title, author, year){
    // console.log('Book Initialize...');
    this.title = title;
    this.author = author;
    this.year = year;

    //the function below can be remove into prototype
    this.getSummary = function(){
        return `${this.title} was written by 
        ${this.author} in ${this.year}`;
    }
}

//Instatiate an Object
const book1 = new Book('Book 1', 'john Doe', '2013')
const book2 = new Book('Book 2', 'jane Doe', '2016')

console.log(book1.title);
console.log(book1);

//make get summary a prototype
Book.prototype.getSummary = function(){
    return `${this.title} was written by 
    ${this.author} in ${this.year}`; 
}

console.log(book2.getSummary())

