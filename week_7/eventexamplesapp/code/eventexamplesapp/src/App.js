
import React, { Component } from 'react';
import CurrencyConverter from './CurrencyConverter';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 0
    };
  }

  // Method to increment
  increment = () => {
    this.setState({ count: this.state.count + 1 });
    this.sayHello();
  };

  // Method to decrement
  decrement = () => {
    this.setState({ count: this.state.count - 1 });
  };

  // Called from increment
  sayHello = () => {
    console.log("Hello! This is a static message.");
  };

  // Function with argument
  sayWelcome = (msg) => {
    alert(msg);
  };

  // Synthetic event example
  handleClick = (event) => {
    alert("I was clicked (synthetic event)");
    console.log("Synthetic Event Object:", event);
  };

  render() {
    return (
      <div style={{ textAlign: 'center', marginTop: '40px' }}>
        <h1>React Event Handling</h1>

        <h2>Counter: {this.state.count}</h2>
        <button onClick={this.increment}>Increment</button>{" "}
        <button onClick={this.decrement}>Decrement</button>

        <br /><br />

        <button onClick={() => this.sayWelcome("Welcome to React!")}>
          Say Welcome
        </button>

        <br /><br />

        <button onClick={this.handleClick}>
          Synthetic Event: Click Me
        </button>

        <br /><br />

        <CurrencyConverter />
      </div>
    );
  }
}

export default App;
