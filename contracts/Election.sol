pragma solidity ^0.4.2;
contract Election{
  //Store condidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;

  }
  //store accoung that have voted
  mapping(address => bool) public voters;

  mapping(uint => Candidate)public candidates;

  event votedEvent(uint _candidateId);

  uint public candidatesCount;
  function Election() public{
    addCanditate("Candidate 1");
    addCanditate("Candidate 2");
  }

  function addCanditate(string _name) private{
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }


function vote(uint _candidateId) public{
  //  require they havent vote before
  require(!voters[msg.sender]);
  //require a valid candidate

  require(_candidateId > 0 && _candidateId <= candidatesCount);
  //record that voter has voted
    voters[msg.sender]= true;
  //update voteCount
  candidates[_candidateId].voteCount ++;
  emit votedEvent(_candidateId);
}
}
