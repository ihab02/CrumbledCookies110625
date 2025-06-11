import React from "react";
import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import Home from "./pages/Home";
import Flavors from "./pages/Flavors";
import AdminLogin from "./pages/admin/AdminLogin";
import "./App.css";

function App() {
  return (
    <Router>
      <nav className="main-nav">
        <Link to="/">Home</Link>
        <Link to="/flavors">Flavors</Link>
      </nav>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/flavors" element={<Flavors />} />
        <Route path="/admin/login" element={<AdminLogin />} />
      </Routes>
    </Router>
  );
}

export default App;
