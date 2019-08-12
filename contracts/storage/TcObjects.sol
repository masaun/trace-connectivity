pragma solidity ^0.5.0;


contract TcObjects {

    // struct SchoolList {
    //     mapping (uint => School) schools;
    // }

    struct School {
        uint id;
        string countryName;     // Name of country
        string schoolName;    // Name of district
        address ispAddr;        // Current ISP address which provide connectivity at the moment
        uint uploadSpeedStantdard;
        uint downloadSpeedStantdard;
        uint timestamp;
    }

    struct Isp {
        string name;
        address addr;
        uint balance;
        //uint uploadSpeed;    // Move to struct of District
        //uint downloadSpeed;  // Move to struct of District
        bool rightAsIsp;       // Right as ISP. If upload/download speed doesn't reach standard value, this value become false.
        uint timestamp;
    }


    struct Donor {
        string name;
        address addr;  // Donor's wallet address
        uint donateAmount;
        uint timestamp;
    }


    struct Fund {
        address donorAddr;
        uint fundAmountFromDonor;    // Individual amount of being funded from donor
        uint fundTotalAmount;        // Total amount of being funded
    }


}
