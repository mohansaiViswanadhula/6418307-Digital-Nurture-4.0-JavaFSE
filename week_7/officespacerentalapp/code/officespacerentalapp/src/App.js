import React from 'react';

function App() {
  const office = {
    name: "Elite Office Space",
    rent: 85000,
    address: "10th street,sector-42"
  };

  const officeList = [
    { name: "Tech Hub", rent: 55000, address: "mumbai, India" },
    { name: "Startup Space", rent: 62000, address: "banglore, India" },
    { name: "Innovation Centre", rent: 45000, address: "hyderabad, Telangana" },
    { name: "Skyline Offices", rent: 80000, address: "chennai, India" }
  ];

  const officeImage = "https://via.placeholder.com/600x300?text=Office+Space";

  return (
    <div style={{ textAlign: 'center', fontFamily: 'Arial' }}>
      <h1>Office Space Rental App</h1>
      <img src={officeImage} alt="Office Space" style={{ width: '60%', height: 'auto', borderRadius: '10px' }} />

      <h2>Featured Office</h2>
      <p><b>Name:</b> {office.name}</p>
      <p>
        <b>Rent:</b>{" "}
        <span style={{ color: office.rent > 60000 ? "green" : "red" }}>
          ₹ {office.rent}
        </span>
      </p>
      <p><b>Address:</b> {office.address}</p>

      <h2>Available Offices</h2>
      <ul style={{ listStyleType: 'none', padding: 0 }}>
        {officeList.map((item, index) => (
          <li key={index} style={{ border: '1px solid #ccc', margin: '10px', padding: '10px', borderRadius: '8px' }}>
            <p><b>Name:</b> {item.name}</p>
            <p>
              <b>Rent:</b>{" "}
              <span style={{ color: item.rent > 60000 ? "green" : "red" }}>
                ₹ {item.rent}
              </span>
            </p>
            <p><b>Address:</b> {item.address}</p>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default App;

