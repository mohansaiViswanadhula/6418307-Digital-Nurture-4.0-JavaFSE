import React from 'react';

const ListofPlayers = () => {
  const players = [
    { name: "Rohit", score: 95 },
    { name: "Virat", score: 88 },
    { name: "Gill", score: 45 },
    { name: "Pant", score: 72 },
    { name: "Hardik", score: 50 },
    { name: "Jadeja", score: 60 },
    { name: "Shami", score: 30 },
    { name: "Bumrah", score: 40 },
    { name: "Surya", score: 91 },
    { name: "Rahul", score: 55 },
    { name: "Kuldeep", score: 68 }
  ];

  const filteredPlayers = players.filter(player => player.score < 70);

  return (
    <div>
      <h2>All Players</h2>
      <ul>
        {players.map((p, index) => (
          <li key={index}>{p.name} - {p.score}</li>
        ))}
      </ul>

      <h3>Players with score below 70</h3>
      <ul>
        {filteredPlayers.map((p, index) => (
          <li key={index}>{p.name} - {p.score}</li>
        ))}
      </ul>
    </div>
  );
};

export default ListofPlayers;
