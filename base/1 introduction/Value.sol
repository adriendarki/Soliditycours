pragma solidity ^0.7.0;
contract Value {
    string value;

    constructor() {
        value = "myValue";
    }


    function get() public view returns(string memory ){
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }
}
