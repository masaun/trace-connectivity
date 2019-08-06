pragma solidity ^0.5.0;


contract TcEvents {

    event SchoolRegistry (
        string countryName,
        string schoolName,
        uint uploadSpeedStantdard,
        uint downloadSpeedStantdard,
        bool isReachUploadSpeedStantdard,
        bool isReachDownloadSpeedStantdard,
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

}
