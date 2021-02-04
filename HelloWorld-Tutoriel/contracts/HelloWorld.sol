pragma solidity >=0.4.0<0.9.0;

contract HelloWorld {
    string public sentence;
    string public userName;

    constructor() {
        sentence = "HelloWorld !";
        userName = "Guillaume";
    }

    function saySomething() public view returns(string memory){
        return (concat(sentence, userName));
    }

    function changeSentence(string memory newSentence) public {
        sentence = newSentence;
    }

    function concat(string memory _base, string memory _value) internal pure returns (string memory) {
           bytes memory _baseBytes = bytes(_base);
           bytes memory _valueBytes = bytes(_value);

           string memory _tmpValue = new string(_baseBytes.length + _valueBytes.length);
           bytes memory _newValue = bytes(_tmpValue);

           uint i;
           uint j;

           for(i=0; i<_baseBytes.length; i++) {
               _newValue[j++] = _baseBytes[i];
           }

           for(i=0; i<_valueBytes.length; i++) {
               _newValue[j++] = _valueBytes[i];
           }

           return string(_newValue);
       }

}