import React from "react";

class HelloWorld extends React.Component {
  state = { sentence: null };

  componentDidMount() {
    const { drizzle, drizzleState } = this.props;
    const helloWorld = drizzle.contracts.HelloWorld;

    const sentence = helloWorld.methods["saySomething"].cacheCall({ from: drizzleState.accounts[0], gas:3000000});

    this.setState({ sentence });
  }

  render() {
    const { HelloWorld } = this.props.drizzleState.contracts;

    console.log(this.state.sentence);

    return (
        <div>
           <p>Sentence : {HelloWorld.saySomething[this.state.sentence] && HelloWorld.saySomething[this.state.sentence].value}</p>
        </div>
    );
  }
}

export default HelloWorld;