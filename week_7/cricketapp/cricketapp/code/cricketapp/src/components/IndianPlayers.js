import React from 'react';

const IndianPlayers = () => {
  const t20Players = ["Rohit", "Kohli", "Gill"];
  const ranjiPlayers = ["Sarfaraz", "Pujara", "Rahane"];
  const allPlayers = [...t20Players, ...ranjiPlayers]; // Merge using ES6 spread

  // Destructuring into odd and even team
  const oddPlayers = allPlayers.filter((_, index) => index % 2 === 0);
  const evenPlayers = allPlayers.filter((_, index) => index % 2 !== 0);

  return (
    <div>
      <h2>All Indian Players</h2>
      <p>All: {allPlayers.join(', ')}</p>

      <h3>Odd Team Players</h3>
      <ul>
        {oddPlayers.map((player, i) => <li key={i}>{player}</li>)}
      </ul>

      <h3>Even Team Players</h3>
      <ul>
        {evenPlayers.map((player, i) => <li key={i}>{player}</li>)}
      </ul>
    </div>
  );
};

export default IndianPlayers;
