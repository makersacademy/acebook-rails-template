import React from 'react'
import { Link } from 'react-router-dom';

const Header = (props) => {
 return (
   <nav className="navbar navbar-expand-sm navbar-dark bg-danger mb-3 py-0">
     <div className="container">
       <a href='/' className='navbar-brand'>Acebook</a>
       <div>
         <ul className="navbar-nav mr-auto">
           <li className="nav-item">
             <Link to='/' className="nav-link">
               Home
             </Link>
           </li>
           <li className="nav-item">
             <Link to='/login' className="nav-link">
               login
             </Link>
           </li>
           <li className="nav-item">
             <Link to='/register' className="nav-link">
               Register
             </Link>
           </li>
         </ul>
       </div>
     </div>
   </nav>
 )
}

export default Header