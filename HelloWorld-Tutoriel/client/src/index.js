import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';

import Drizzle  from "drizzle";
import HelloWorld from "./contracts/HelloWorld.json";

const options = {
  contracts: [HelloWorld],
  web3: {
    fallback: {
      type: "ws",
      url: "ws://127.0.0.1:9545",
    },
  },
};

const drizzle = new Drizzle(options);

ReactDOM.render(document.getElementById('root'));
serviceWorker.unregister();