pragma solidity 0.5.16;
   
contract Election {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;

    uint public candidatesCount;

    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory x) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, x, 0);
    }
    mapping(address => bool) public voters;

    function vote(uint _candidateID) public{
        require(!voters[msg.sender]);
        require(_candidateID > 0 && _candidateID <= candidatesCount);
        voters[msg.sender] = true;
        candidates[_candidateID].voteCount ++;
    }

}


