pragma solidity ^0.6.4;

contract NameAll {
    uint256  public peopleCount = 0;
    mapping(uint => Person) public people;

    struct Person {
        uint id;
        string _fristName;
        string _lastName;
    }

    function addPerson(string memory _firstName, string memory _lastName) public {
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
}