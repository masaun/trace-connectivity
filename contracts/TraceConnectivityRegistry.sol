pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";


contract TraceConnectivityRegistry is TcStorage, TcOwnable {

    uint public ispId;
    uint public donorId;

    constructor() public {
        ispId = 1;     // ISP's ID is started count from 1
        donorId = 1;   // Donor's ID is started count from 1
    }


    function ispRegistry(
        string memory _name,
        address _addr
    ) public returns (string memory, address, bool, uint)
    {
        uint _id;
        _id = ispId;

        Isp storage isp = isps[_id];
        isp.name = _name;
        isp.addr = _addr;
        isp.rightAsIsp = false;
        isp.timestamp = now;

        emit IspRegistry(isp.name, isp.addr, isp.rightAsIsp, isp.timestamp);

        ispId++;

        return (isp.name, isp.addr, isp.rightAsIsp, isp.timestamp);
    }


    function donorRegistry(
        string memory _name,
        address _addr, // Donor's wallet address
        uint _donateAmount
    ) public payable returns (string memory, address, uint, uint)
    {
        uint _id;
        _id = donorId;

        Donor storage donor = donors[_id];
        donor.name = _name;
        donor.addr = _addr;
        donor.donateAmount = _donateAmount;
        donor.timestamp = now;

        emit DonorRegistry(donor.name, donor.addr, donor.timestamp, donor.donateAmount);
    }


}
