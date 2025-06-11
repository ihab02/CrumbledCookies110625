import React from "react";
import "./Flavors.css";

const flavors = [
  { id: 1, name: "Chocolate Chip", description: "Classic and gooey.", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80" },
  { id: 2, name: "Red Velvet", description: "Rich and decadent.", image: "https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80" },
  { id: 3, name: "Peanut Butter", description: "Nutty and sweet.", image: "https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80" },
  { id: 4, name: "Oatmeal Raisin", description: "Chewy and wholesome.", image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80" },
];

export default function Flavors() {
  return (
    <div className="flavors-container">
      <h2>Our Flavors</h2>
      <div className="flavors-grid">
        {flavors.map(flavor => (
          <div className="flavor-card" key={flavor.id}>
            <img src={flavor.image} alt={flavor.name} />
            <h3>{flavor.name}</h3>
            <p>{flavor.description}</p>
          </div>
        ))}
      </div>
    </div>
  );
} 