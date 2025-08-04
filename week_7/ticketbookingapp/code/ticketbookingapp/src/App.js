import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isLoggedIn: false
    };
  }

  handleLogin = () => {
    this.setState({ isLoggedIn: true });
  };

  handleLogout = () => {
    this.setState({ isLoggedIn: false });
  };

  render() {
    let page;
    let button;

    if (this.state.isLoggedIn) {
      page = <UserPage />;
      button = <button onClick={this.handleLogout}>Logout</button>;
    } else {
      page = <GuestPage />;
      button = <button onClick={this.handleLogin}>Login</button>;
    }

    return (
      <div style={{ textAlign: 'center', marginTop: '50px' }}>
        <h1>Ticket Booking App</h1>
        {button}
        {page}
      </div>
    );
  }
}

// Guest Component
function GuestPage() {
  return (
    <div>
      <h2>Welcome Guest!</h2>
      <p>Flight Details:</p>
      <ul style={{ listStyleType: 'none' }}>
        <li>Flight: AI202 - New Delhi to Mumbai - 9:00 AM</li>
        <li>Flight: AI303 - Mumbai to Bangalore - 12:00 PM</li>
        <li>Flight: AI404 - Chennai to Kolkata - 5:00 PM</li>
      </ul>
      <p><b>Note:</b> Please login to book tickets.</p>
    </div>
  );
}

// User Component
function UserPage() {
  return (
    <div>
      <h2>Welcome User!</h2>
      <p>You can now book your flight tickets.</p>
      <button style={{ padding: '10px 20px', fontSize: '16px' }}>Book Tickets</button>
    </div>
  );
}

export default App;

