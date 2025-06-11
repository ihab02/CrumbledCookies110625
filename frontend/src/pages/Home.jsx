import React from "react";
import { Link } from "react-router-dom";
import "./Home.css";

export default function Home() {
  return (
    <div className="home-container">
      <section className="hero">
        <h1>Handcrafted Cookies<br/>Made Fresh Daily</h1>
        <p>Premium ingredients, traditional recipes, and a passion for perfection in every bite.</p>
        <div className="home-links">
          <Link to="/flavors" className="btn">Explore Our Flavors</Link>
          <Link to="/packs" className="btn btn-secondary">View Bundles</Link>
        </div>
      </section>
      <section className="header-slider">
        {/* Placeholder for CMS header slider */}
        <div className="slider-placeholder">[Header Slider Coming Soon]</div>
      </section>
    </div>
  );
} 