pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";


contract TraceConnectivityRegistry is TcStorage, TcOwnable {

    uint public schoolId;
    uint public ispId;
    uint public donorId;

    constructor() public {
        schoolId = 1; // District's ID is started count from 1
        ispId = 1;      // ISP's ID is started count from 1
        donorId = 1;    // Donor's ID is started count from 1
    }



    function schoolRegistry(
        string memory _countryName,
        string memory _schoolName,
        uint _uploadSpeedStantdard,
        uint _downloadSpeedStantdard
    ) public returns (string memory, string memory, uint, uint, bool, bool, uint)
    {
        uint _id;
        _id = schoolId;

        School storage school = schools[_id];
        school.countryName = _countryName;
        school.schoolName = _schoolName;
        school.uploadSpeedStantdard = _uploadSpeedStantdard;
        school.downloadSpeedStantdard = _downloadSpeedStantdard;
        school.isReachUploadSpeedStantdard = false;
        school.isReachDownloadSpeedStantdard = false;
        school.timestamp = now;

        emit SchoolRegistry(
            school.countryName,
            school.schoolName, 
            school.uploadSpeedStantdard, 
            school.downloadSpeedStantdard,
            school.isReachUploadSpeedStantdard,
            school.isReachDownloadSpeedStantdard,
            school.timestamp
        );

        schoolId++;

        return (
            school.countryName,
            school.schoolName, 
            school.uploadSpeedStantdard, 
            school.downloadSpeedStantdard,
            school.isReachUploadSpeedStantdard,
            school.isReachDownloadSpeedStantdard,
            school.timestamp
        );
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
