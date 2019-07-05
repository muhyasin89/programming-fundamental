/*
    Before this file using ES5

    now we using ES6
*/

class Book {
    constructor(title, author, year) {
        this.title = title;
        this.author = author;
        this.year = year;
    }

    getSummary(){
        return `${this.title} was written by 
        ${this.author} in ${this.year}`;
    }

    getAge(){
        const years = new Date().getFullYear() - this.year;
        return `${this.title} is ${years} year old`;
    }

    revise(newYear){
        this.year = newYear;
        this.revise = true;
    }

    static topBookStore() {
        return 'Baren and Noble';
    }
}

//Instantiate Object
const book1 = new Book('Book One', 'John Doe', '2013');

console.log(book1);
book1.revise('2018');
console.log(book1);

/* console.log(book1.topBookStore());  //this is not working
because static must be call in original class */

console.log(Book.topBookStore());