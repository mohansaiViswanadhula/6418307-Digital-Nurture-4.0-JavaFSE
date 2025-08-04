import React, { Component } from 'react';

class CurrencyConverter extends Component {
  constructor(props) {
    super(props);
    this.state = {
      rupees: '',
      euro: ''
    };
  }

  handleChange = (e) => {
    this.setState({ rupees: e.target.value });
  };

  handleSubmit = (e) => {
    e.preventDefault();
    const euro = (this.state.rupees / 90).toFixed(2);
    this.setState({ euro });
  };

  render() {
    return (
      <div style={{ marginTop: '40px' }}>
        <h2>Currency Converter</h2>
        <form onSubmit={this.handleSubmit}>
          <input
            type="number"
            placeholder="Enter amount in ₹"
            value={this.state.rupees}
            onChange={this.handleChange}
          />
          <button type="submit">Convert to Euro</button>
        </form>

        {this.state.euro && (
          <p>Equivalent in Euro: € {this.state.euro}</p>
        )}
      </div>
    );
  }
}

export default CurrencyConverter;
