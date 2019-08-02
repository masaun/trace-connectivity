pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";


contract TraceConnectivityRegistry is TcStorage, TcOwnable {

    constructor() public {}


    function ISPRegistry(uint _id) public returns (bool) {
        
    }


    function DonorRegistry() public returns (bool) {
         
    }

}
