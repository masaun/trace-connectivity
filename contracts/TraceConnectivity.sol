pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";
import "./TraceConnectivityRegistry.sol";


contract TraceConnectivity is TcStorage, TcOwnable, TraceConnectivityRegistry {

    constructor() public {}

    function ISPIndex() public returns (bool) {
                 
    }


    function ISPDetail() public returns (bool) {
         
    }


}
