pragma solidity ^0.8.1;

// mon commentaire
contract NameAll {
    uint256  public peopleCount = 0;

    mapping(uint => Person) public people;

    struct Person {
        uint id;
        string _firstname;
        string _lastName;
    }

    function addPerson(string memory _firstname, string memory _lastName) public {
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstname, _lastName);
    }
}