import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

import HelloWorld from "./contracts/HelloWorld";

class App extends Component {
    state = { loading: true, drizzleState: null };
    componentDidMount() {
        const { drizzle } = this.props;
        this.unsubscribe = drizzle.store.subscribe(() => {
            const drizzleState = drizzle.store.getState();
            if (drizzleState.drizzleStatus.initialized) {
                this.setState({ loading: false, drizzleState });
            }
        });
    }

  render() {
        if (this.state.loading) return "Loading Drizzle...";
        return (
          <div className="App">
            <HelloWorld
                drizzle={this.props.drizzle}
                drizzleState={this.state.drizzleState}
            />
          </div>
        );
  }
}

export default App;