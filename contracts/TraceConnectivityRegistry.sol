pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";


contract TraceConnectivityRegistry is TcStorage, TcOwnable {

    uint public schoolId;
    uint public ispId;
    uint public donorId;

    constructor() public {
        schoolId = 1;   // District's ID is started count from 1
        ispId = 1;      // ISP's ID is started count from 1
        donorId = 1;    // Donor's ID is started count from 1
    }



    function schoolRegistry(
        string memory _schoolName,
        string memory _countryName,
        address _ispAddr,  // This ISP has right which can provide connectivity 
        uint _uploadSpeedStantdard,
        uint _downloadSpeedStantdard
    ) public returns (uint, string memory, string memory, address, uint, uint, uint)
    {
        uint _id;
        _id = schoolId;

        School storage school = schools[_id];
        school.id = _id;
        school.schoolName = _schoolName;
        school.countryName = _countryName;
        school.ispAddr = _ispAddr;
        school.uploadSpeedStantdard = _uploadSpeedStantdard;
        school.downloadSpeedStantdard = _downloadSpeedStantdard;
        school.timestamp = now;

        emit SchoolRegistry(
            school.id,
            school.schoolName,
            school.countryName,
            school.ispAddr,
            school.uploadSpeedStantdard, 
            school.downloadSpeedStantdard,
            school.timestamp
        );

        return (
            school.id,
            school.schoolName,
            school.countryName,
            school.ispAddr,
            school.uploadSpeedStantdard, 
            school.downloadSpeedStantdard,
            school.timestamp
        );

        schoolId++;
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
 
        donorId++;
        
        return (donor.name, donor.addr, donor.timestamp, donor.donateAmount);     
    }


}
