pragma solidity ^0.5.0;

import "../openzeppelin-solidity/contracts/ownership/Ownable.sol";


contract TcOwnable is Ownable {

    // modifier onlyDonor(uint _donorAddr) { 
    //     require (msg.sender == address(_donorAddr));
    //     _;
    // }

    // example
    modifier onlyStakingPerson(uint _time) { 
        require (now >= _time);
        _;
    }
    
}
