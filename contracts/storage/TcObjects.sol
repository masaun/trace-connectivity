pragma solidity ^0.5.0;


contract TcObjects {

    struct ISP {
        address addr;
        uint uploadSpeed;
        uint downloadSpeed;
        uint timestamp;
    }

    struct Donor {
        address addr;
        uint donateAmount;
    }
    





    struct Something {
        // In progress
        address addr;
        uint value;
    }


    struct Voter {
        uint weight; // weight is accumulated by delegation
        bool voted;  // if true, that person already voted
        address delegate; // person delegated to
        uint vote;   // index of the voted proposal
    }

    // This is a type for a single proposal.
    struct Proposal {
        bytes32 name;   // short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }
}
