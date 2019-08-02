pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";
import "./TraceConnectivityRegistry.sol";


contract TraceConnectivity is TcStorage, TcOwnable, TraceConnectivityRegistry {

    constructor() public {}

    function IspIndex() public returns (bool) {
        // [Note]： Don't implementation right now.
        //return isps.length;
    }


    function IspDetail(uint _id) public view returns (string memory, address) {
        Isp memory isp = isps[_id];
        return (isp.name, isp.addr);
    }


}
