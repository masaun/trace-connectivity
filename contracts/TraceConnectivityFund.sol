pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";
import "./TraceConnectivityRegistry.sol";


/* dev Donors donate in this contract */ 
contract TraceConnectivityFund is TcStorage, TcOwnable, TraceConnectivityRegistry {

    constructor() public {}


    function FundFromDonor(
        address _donorAddr,
        uint _fundAmountFromDonor,
        uint _fundTotalAmount
    ) public returns (bool res) 
    {
        Fund storage fund = funds[_donorAddr];
        fund.donorAddr = _donorAddr;
        fund.fundAmountFromDonor = _fundAmountFromDonor;
        fund.fundTotalAmount = _fundTotalAmount;
    }
}
