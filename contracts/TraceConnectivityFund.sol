pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";
import "./TraceConnectivityRegistry.sol";


/* dev Donors donate in this contract */ 
contract TraceConnectivityFund is TcStorage, TcOwnable, TraceConnectivityRegistry {

    constructor() public {}

}
