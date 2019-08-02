pragma solidity ^0.5.0;


contract TcEvents {

    event IspRegistry (
        string name,
        address addr,
        uint timestamp
    );



    event SomethingEvent (
        address indexed addr,
        uint indexed value
    );

}
