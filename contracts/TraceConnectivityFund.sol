pragma solidity >=0.4.22 <0.6.0;

import "./openzeppelin-solidity/contracts/math/SafeMath.sol";
import "./openzeppelin-solidity/contracts/payment/escrow/Escrow.sol";
import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";
import "./TraceConnectivityRegistry.sol";


/* dev Donors donate in this contract */ 
contract TraceConnectivityFund is TcStorage, TcOwnable, TraceConnectivityRegistry, Escrow {

    using SafeMath for uint256;

    constructor() public {}


    /**
    * @dev Fund（Deposit）from donor.
    */
    function fundFromDonor(
        address _donorAddr,
        uint _fundAmountFromDonor
    ) 
        public
        //onlyDonor(_donorAddr)
        payable
        returns (address, uint, uint)
    {
        address _fundAddr = address(this);  // Assign this contract address

        Fund storage fund = funds[_fundAddr];
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


    /**
    * @dev If ISP who has right of providing connectivty satisfy the condition of connectivity, this function transfer rewards to ISP by using funded amount.
    */
    function transferRewardToIsp(
        address payable _ispAddr,
        uint _rewardAmount
    )  
        public
        payable
        returns (address ispAddr, uint rewardAmount, uint fundTotalAmount, uint ispBalance)
    {
        address _fundAddr = address(this);  // Assign this contract address

        Fund storage fund = funds[_fundAddr];
        fund.fundTotalAmount = fund.fundTotalAmount.sub(_rewardAmount);

        /* Fail */
        Isp storage isp = isps[0];
        isp.balance = isp.balance.add(_rewardAmount);

        //_ispAddr.transfer(msg.value);
        //_ispAddr.transfer(_rewardAmount);

        //emit TransferRewardToIsp(_ispAddr, _rewardAmount, address(this).balance);
        emit TransferRewardToIsp(_ispAddr, _rewardAmount, fund.fundTotalAmount, isp.balance);

        return (_ispAddr, _rewardAmount, fund.fundTotalAmount, isp.balance);


        /* Success */ 
        //withdraw(_ispAddr);  // [For test]： Reference from withdraw function in Escrow.sol


        transferReward(_ispAddr, _rewardAmount);  // [For test]： Reference from withdraw function in Escrow.sol
    }

}
