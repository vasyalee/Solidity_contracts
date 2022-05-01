// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Ballot {
    uint[] proposals;
    uint proposalsLength;
    mapping (address => uint) userProposal;
    mapping (address => bool) hasVoted;

    constructor(uint _numberOfProposals) {
        proposalsLength = _numberOfProposals;
        proposals = new uint[](proposalsLength);
    }


    function vote(uint _proposal) public {
        require(hasVoted[msg.sender] == false && _proposal <= proposals.length);
        userProposal[msg.sender] = _proposal - 1;
        proposals[_proposal - 1]++;
        hasVoted[msg.sender] = true;
    }

    function getProposals(uint _numberOfProposal) public view returns(uint numberOfVotes) {
        return proposals[_numberOfProposal - 1];
    }

    function getVoters(address voter) public view returns(uint _proposalNumber) {
        return userProposal[voter];
    }
}