pragma solidity ^0.4.19;

contract BadgeCreator {

    bytes public id;
    bytes public name;

    function BadgeCreator(bytes uportId, bytes uportName) public {
        id = uportId;
        name = uportName;
    }
}