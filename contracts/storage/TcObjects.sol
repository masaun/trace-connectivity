pragma solidity ^0.5.0;


contract TcObjects {

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
