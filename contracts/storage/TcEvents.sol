pragma solidity ^0.5.0;


contract TcEvents {

    event SchoolRegistry (
        uint id,
        string schoolName,
        string countryName,
        address ispAddr,
        uint uploadSpeedStantdard,
        uint downloadSpeedStantdard,
        uint timestamp
    );

    event IspRegistry (
        string name,
        address addr,
        bool rightAsIsp,
        uint timestamp
    );

    event DonorRegistry (
        string name,
        address addr,
        uint donateAmount,
        uint timestamp
    );

    event UpdateConnectivityData(
        //address schoolAddr,
        string schoolName,
        uint timestamp
    );

    event FundFromDonor(
        address donorAddr,
        uint fundAmountFromDonor,
        uint fundTotalAmount
    );

    event TransferRightOfIsp(
        uint oldIspId,
        bool oldIspRightAsIsp,
        uint newIspId,
        bool newIspRightAsIsp,
        uint schoolId,
        address newIspAddr
    );

    event TransferRewardToIsp(
        address ispAddr,
        uint rewardAmount,
        uint fundTotalAmount,
        uint ispBalance
    );
}
