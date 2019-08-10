pragma solidity >=0.4.22 <0.6.0;

import "./openzeppelin-solidity/contracts/math/SafeMath.sol";
import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";
import "./TraceConnectivityRegistry.sol";


/* dev Donors donate in this contract */ 
contract TraceConnectivityFund is TcStorage, TcOwnable, TraceConnectivityRegistry {

    using SafeMath for uint256;

    constructor() public {}


    function fundFromDonor(
        address _donorAddr,
        uint _fundAmountFromDonor
    ) 
        public
        //onlyDonor(_donorAddr)
        payable
        returns (address, uint, uint)
    {
        Fund storage fund = funds[_donorAddr];
        fund.donorAddr = _donorAddr;
        fund.fundAmountFromDonor = _fundAmountFromDonor;
        fund.fundTotalAmount = fund.fundTotalAmount.add(_fundAmountFromDonor);

        emit FundFromDonor(
            fund.donorAddr,
            fund.fundAmountFromDonor,
            fund.fundTotalAmount
        );

        return (
            fund.donorAddr,
            fund.fundAmountFromDonor,
            fund.fundTotalAmount
        );
    }
}
