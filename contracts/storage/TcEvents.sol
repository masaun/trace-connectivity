pragma solidity ^0.5.0;


contract TcEvents {

    event SchoolRegistry (
        uint id,
        string schoolName,
        string countryName,
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
        uint _oldIspId,
        bool _oldIspRightAsIsp,
        uint _newIspId,
        bool _newIspRightAsIsp,
        uint _schoolId,
        address _newIspAddr
    );
    
}
