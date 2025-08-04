import React from 'react';

const books = [
  { id: 1, title: "React Explained", author: "Zac Gordon" },
  { id: 2, title: "JavaScript: The Good Parts", author: "Douglas Crockford" }
];

function BookDetails() {
  return (
    <div>
      <h2>Book Details</h2>
      <ul>
        {books.map((book) => (
          <li key={book.id}>
            <b>{book.title}</b> by {book.author}
          </li>
        ))}
      </ul>
    </div>
  );
}

export default BookDetails;
