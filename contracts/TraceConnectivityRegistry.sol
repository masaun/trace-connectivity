pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";


contract TraceConnectivityRegistry is TcStorage, TcOwnable {

    constructor() public {}

    function ispRegistry(
        uint _id,
        string memory _name,
        address _addr
    ) public returns (bool)
    {
        Isp storage isp = isps[_id];
        isp.name = _name;
        isp.addr = _addr;
        isp.timestamp = now;

    }


    function donorRegistry() public returns (bool) {
         
    }

}
