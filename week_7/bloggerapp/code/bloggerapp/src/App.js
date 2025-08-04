import React, { Component } from 'react';
import BookDetails from './BookDetails';
import BlogDetails from './BlogDetails';
import CourseDetails from './CourseDetails';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      view: 'book' // book, blog, or course
    };
  }

  changeView = (viewName) => {
    this.setState({ view: viewName });
  };

  render() {
    let element;

    // 1️⃣ if-else rendering
    if (this.state.view === 'book') {
      element = <BookDetails />;
    } else if (this.state.view === 'blog') {
      element = <BlogDetails />;
    } else {
      element = <CourseDetails />;
    }

    return (
      <div style={{ textAlign: 'center', marginTop: '40px' }}>
        <h1>Blogger App</h1>

        {/* 2️⃣ Buttons to change state */}
        <button onClick={() => this.changeView('book')}>Book</button>{" "}
        <button onClick={() => this.changeView('blog')}>Blog</button>{" "}
        <button onClick={() => this.changeView('course')}>Course</button>

        <hr />

        {/* 3️⃣ Render element from if-else */}
        {element}

        <hr />

        {/* 4️⃣ Ternary rendering */}
        {this.state.view === 'book' ? <p>You're viewing Book details.</p> : <p>Not viewing books.</p>}

        {/* 5️⃣ Logical AND (&&) rendering */}
        {this.state.view === 'course' && <p>These are Course related contents.</p>}
      </div>
    );
  }
}

export default App;
