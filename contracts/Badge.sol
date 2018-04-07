pragma solidity ^0.4.19;

contract Badge {

    bytes public name;
    bytes public description;
    bytes public ipfsHash;

    function Badge(bytes badgeName, bytes badgeDescription, bytes ipfsIdentifier) public {
        name = badgeName;
        description = badgeDescription;
        ipfsHash = ipfsIdentifier;
    }

}