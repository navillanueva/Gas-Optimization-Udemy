// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.15;

contract OptimizedVote {
    struct Voter {
        uint8 vote;
        bool voted;
    }

    struct Proposal {
        uint8 voteCount;
        bytes32 name;
        bool ended;
    }

    mapping(address => Voter) public voters;

    Proposal[] proposals;

    function createProposal(bytes32 _name) external {
        proposals.push(Proposal({voteCount: 0, name: _name, ended: false}));
    }

    function vote(uint8 _proposal) external {
        require(!voters[msg.sender].voted, 'already voted');
        Voter memory aux = voters[msg.sender];
        aux.vote = _proposal;
        aux.voted = true;
        // no need to check for overflow with this operation
        unchecked {
            proposals[_proposal].voteCount += 1;
        }
    }

    function getVoteCount(uint8 _proposal) external view returns (uint8) {
        return proposals[_proposal].voteCount;
    }
}
