const s1 = 'Hello';
console.log(typeof s1);
console.log(s1.toUpperCase());

/*s1 is string but can call method like function
  it happens because javascript wrap it up so it not
  appear as string
*/
const s2 = new String('Hello');
console.log(typeof s2);


console.log(window);
// console.log(window.alert('this is wew!'));
// console.log(alert('this is wew!'));

// Object Literal
const book1={
    title: 'Book One',
    author: 'Jhon Doe',
    year: '2013',
    getSummary: function(){
        return `${this.title} was written by 
        ${this.author} in ${this.year}`;
    }
}

console.log(book1);
console.log(book1.getSummary())


// way to show value of object
console.log(Object.values(book1))
console.log(Object.keys(book1))

//For multiple Object
const book2={
    title: 'Book Two',
    author: 'Jane Doe',
    year: '2014',
    getSummary: function(){
        return `${this.title} was written by 
        ${this.author} in ${this.year}`;
    }
}

