import React, { useState } from 'react';
import axios from 'axios';

function App() {
  // 1. These variables hold what the user types
  const [values, setValues] = useState({
    full_name: '',
    agency_name: '',
    email: '',
    phone: '',
    password: ''
  });

  const [message, setMessage] = useState('');

  // 2. This handles typing in the boxes
  const handleChange = (event) => {
    setValues({ ...values, [event.target.name]: event.target.value });
  };

  // 3. This runs when they click "Sign Up"
  const handleSubmit = (event) => {
    event.preventDefault();
    // Send data to the Server (Port 3001)
    axios.post('http://localhost:3001/register', values)
      .then(res => {
        setMessage("✅ Success: " + res.data);
      })
      .catch(err => {
        // If the server gives an error (like "Email already in use"), show it
        setMessage("❌ Error: " + (err.response ? err.response.data : err.message));
      });
  };

  return (
    <div className="container" style={{ maxWidth: '400px', margin: '50px auto', fontFamily: 'Arial' }}>
      <h2 style={{ textAlign: 'center' }}>🚀 RentBestie Manager Sign Up</h2>
      
      <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '15px' }}>
        
        <input type="text" name="full_name" placeholder="Full Name" required 
          onChange={handleChange} style={{ padding: '10px', fontSize: '16px' }} />

        <input type="text" name="agency_name" placeholder="Agency Name (e.g. Lagos Homes)" required 
          onChange={handleChange} style={{ padding: '10px', fontSize: '16px' }} />

        <input type="email" name="email" placeholder="Email Address" required 
          onChange={handleChange} style={{ padding: '10px', fontSize: '16px' }} />
          
        <input type="text" name="phone" placeholder="Phone Number" required 
          onChange={handleChange} style={{ padding: '10px', fontSize: '16px' }} />

        <input type="password" name="password" placeholder="Create Password" required 
          onChange={handleChange} style={{ padding: '10px', fontSize: '16px' }} />

        <button type="submit" style={{ padding: '10px', backgroundColor: 'black', color: 'white', fontSize: '18px', cursor: 'pointer' }}>
          Register Now
        </button>

      </form>
      
      {/* Show Success or Error Message here */}
      <p style={{ textAlign: 'center', marginTop: '20px', fontWeight: 'bold' }}>{message}</p>
    </div>
  );
}

export default App;