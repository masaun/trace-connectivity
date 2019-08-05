pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";


contract TraceConnectivityRegistry is TcStorage, TcOwnable {

    uint public districtId;
    uint public ispId;
    uint public donorId;

    constructor() public {
        districtId = 1; // District's ID is started count from 1
        ispId = 1;      // ISP's ID is started count from 1
        donorId = 1;    // Donor's ID is started count from 1
    }



    function districtRegistry(
        string memory _countryName,
        string memory _districtName,
        uint _uploadSpeedStantdard,
        uint _downloadSpeedStantdard
    ) public returns (string memory, string memory, uint, uint, bool, bool, uint)
    {
        uint _id;
        _id = districtId;

        District storage district = districts[_id];
        district.countryName = _countryName;
        district.districtName = _districtName;
        district.uploadSpeedStantdard = _uploadSpeedStantdard;
        district.downloadSpeedStantdard = _downloadSpeedStantdard;
        district.isReachUploadSpeedStantdard = false;
        district.isReachDownloadSpeedStantdard = false;
        district.timestamp = now;

        emit DistrictRegistry(
            district.countryName,
            district.districtName, 
            district.uploadSpeedStantdard, 
            district.downloadSpeedStantdard,
            district.isReachUploadSpeedStantdard,
            district.isReachDownloadSpeedStantdard,
            district.timestamp
        );

        districtId++;

        return (
            district.countryName,
            district.districtName, 
            district.uploadSpeedStantdard, 
            district.downloadSpeedStantdard,
            district.isReachUploadSpeedStantdard,
            district.isReachDownloadSpeedStantdard,
            district.timestamp
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
