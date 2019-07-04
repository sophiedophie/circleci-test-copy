import React from 'react';
import './App.css';

export const intialState = 'Initial State';
export const newState = 'Button Clicked~';
export const initialHit = 0;

function App() {
  const [hits, setHits] = React.useState(initialHit);

  return (
    <div className='App'>
      <button data-testid='app-button' onClick={() => setHits(hits + 1)}>
        Change state?
      </button>
      <p id='viewContainer'>
        Seems you hit this button&nbsp;
          <span data-testid='hits'>{hits}</span>
        &nbsp;times.
      </p>
    </div>
  );
}

export default App;
