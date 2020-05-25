pragma solidity ^0.6.8;
contract Value {
    string value;

    constructor() public {
        value = "myValue";
    }


    function get() public view returns(string memory ){
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }
}
