pragma solidity >=0.4.22 <0.6.0;

import "./storage/TcStorage.sol";
import "./modifiers/TcOwnable.sol";
import "./TraceConnectivityRegistry.sol";
import "./TraceConnectivityFund.sol";


contract TraceConnectivity is TcStorage, TcOwnable, TraceConnectivityRegistry, TraceConnectivityFund {

    constructor() public {}

    /* @dev Transfer the right of ISP for providing connedctivity */
    function TransferRightOfIsp(
        uint _oldIspId,
        uint _newIspId,
        address _newIspAddr,
        uint _schoolId,
    ) public returns (bool) 
    {    
        Isp storage isp = isps[_oldIspId];
        isp.rightAsIsp = false;

        Isp storage isp = isps[_newIspId];
        isp.rightAsIsp = true;

        School storage school = schools[_schoolId];
        school.IspAddr = _newIspAddr;  // Change right of old ISP
    }

    /* @dev Update school connectivity data from real-time data */
    function updateConnectivityData(
        uint _schoolId,
        //address _schoolAddr,
        string memory _schoolName,
        uint _uploadSpeedCurrently,
        uint _downloadSpeedCurrently
    ) public returns (string memory, uint, uint, uint) 
    {
        // In progress
        School memory school = schools[_schoolId];
        school.schoolName = _schoolName;
        school.uploadSpeedCurrently = _uploadSpeedCurrently;
        school.downloadSpeedCurrently = _downloadSpeedCurrently;
        school.timestamp = now;

        emit UpdateConnectivityData(
            //address schoolAddr,
            school.schoolName,
            school.uploadSpeedCurrently,
            school.downloadSpeedCurrently,
            school.timestamp
        );

        return (school.schoolName, school.uploadSpeedCurrently, school.downloadSpeedCurrently, school.timestamp);
    }



    function IspIndex() public returns (bool) {
        // [Note]： Don't implementation right now.
        //return isps.length;
    }


    function IspDetail(uint _id) public view returns (string memory, address) {
        Isp memory isp = isps[_id];
        return (isp.name, isp.addr);
    }



    

    


}
