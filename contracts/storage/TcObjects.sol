pragma solidity ^0.5.0;


contract TcObjects {

    struct District {
        string country;     // Name of country
        string district;    // Name of district
        address IspAddr;    // Current ISP address which provide connectivity at the moment
        uint uploadSpeedCurrently;   // Current upload speed
        uint downloadSpeedCurrently; // Current download speed
        
        uint uploadSpeedStantdard;
        uint downloadSpeedStantdard;
        bool isReachUploadSpeedStantdard;
        bool isReachDownloadSpeedStantdard;
    }


    struct Isp {
        string name;
        address addr;
        uint uploadSpeed;
        uint downloadSpeed;
        bool rightAsIsp;  // Right as ISP. If upload/download speed doesn't reach standard value, this value become false.
        uint timestamp;
    }


    struct Donor {
        string name;
        address addr;  // Donor's wallet address
        uint donateAmount;
        uint timestamp;
    }


}
