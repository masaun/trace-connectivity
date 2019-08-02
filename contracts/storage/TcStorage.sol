pragma solidity ^0.5.0;

//import "../openzeppelin-solidity/ReentrancyGuard.sol";
import "../openzeppelin-solidity/contracts/ownership/Ownable.sol";

import "./TcObjects.sol";
import "./TcEvents.sol";


// shared storage
contract TcStorage is TcObjects, TcEvents, Ownable {

    mapping (uint => Isp) isps;

    mapping (uint => Donor) donors;
    


    // example
    mapping (uint => Something) something;

    // A dynamically-sized array of `Proposal` structs.
    Proposal[] public proposals;

    // This declares a state variable that
    // stores a `Voter` struct for each possible address.
    mapping (address => Voter) public voters;

}

