pragma solidity ^0.4.19;

contract Badge {

    bytes32 public name;
    bytes32 public description;
    bytes32 public url;

    function Badge(bytes32 badgeName, bytes32 badgeDescription, bytes32 ipfsUrl) public {
        name = badgeName;
        description = badgeDescription;
        url = ipfsUrl;
    }

    function getName() public view returns (bytes32) {
        return name;
    }

    function getDescription() public view returns (bytes32) {
        return description;
    }

    function getUrl() public view returns (bytes32) {
        return url;
    }

}