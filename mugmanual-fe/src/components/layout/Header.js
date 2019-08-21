import React from 'react';
// import { Link } from 'react-router-dom'

function Header() {
  return (
  <div>
  <header style={headerStyle}>
    Home | Users
  </header>
  </div>
  );
}

export default Header;

const headerStyle = {
    padding: '1.5rem 2.5rem',
    backgroundImage: 'linear-gradient(120deg, #2ddcfb 0%,#2d91fb 100%)',
    margin: '0 0 2rem 0',
    fontSize: '1.5rem',
    color: 'Black',
    textAlign: 'center',
}