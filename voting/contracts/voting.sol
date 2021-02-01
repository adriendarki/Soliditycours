pragma solidity ^0.8.1;

contract Voting {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(address =>bool) public voters;

    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;

    event votedEvent (
        uint indexed _candidateId
    );

    constructor(){
        addCandidate("candidate 1");
        addCandidate("candidate 2");

    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);


    }

    function vote (uint _candidateId) public {
        require(!voters[msg.sender],"Account has voted before");
        require(_candidateId>0&&_candidateId<=candidatesCount,"Invaid candidate been voted");

        voters[msg.sender] = true;

        candidates[_candidateId].voteCount ++;

        emit votedEvent(_candidateId);
    }


}