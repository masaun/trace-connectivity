pragma solidity ^0.5.0;


contract TcObjects {

    struct Isp {
        string name;
        address addr;
        uint uploadSpeed;
        uint downloadSpeed;
        uint timestamp;
    }

    struct Donor {
        string name;
        address addr;
        uint donateAmount;
    }


}
