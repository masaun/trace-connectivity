pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";


contract TraceConnectivityRegistry is TcStorage, TcOwnable {

    uint public ispId;
    uint public donorId;

    constructor() public {
        ispId = 1;     // ISP's ID is started count from 1
        donorId = 1;   // Donor's ID is started count from 1
    }


    function ispRegistry(
        string memory _name,
        address _addr
    ) public returns (bool)
    {
        uint _id;
        _id = ispId;

        Isp storage isp = isps[_id];
        isp.name = _name;
        isp.addr = _addr;
        isp.timestamp = now;

        emit IspRegistry(isp.name, isp.addr, isp.timestamp);

        ispId++;

    }


    function donorRegistry() public returns (bool) {
        
    }

}
