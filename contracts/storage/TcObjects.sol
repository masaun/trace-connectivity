pragma solidity ^0.5.0;


contract TcObjects {

    struct Isp {
        string name;
        address addr;
        uint uploadSpeed;
        uint downloadSpeed;
        uint timestamp;
        bool rightAsIsp;  // Right as ISP. If upload/download speed doesn't reach standard value, this value become false.
    }

    struct Donor {
        string name;
        address addr;
        uint donateAmount;
    }


}
