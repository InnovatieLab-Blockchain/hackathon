pragma solidity ^0.4.18;

contract Badge {

    string public name;
    string public description;
    string public url;

    function Badge(string badgeName, string badgeDescription, string ipfsUrl) public {
        name = badgeName;
        description = badgeDescription;
        url = ipfsUrl;
    }

    function getName() public view returns (string) {
        return name;
    }

    function getDescription() public view returns (string) {
        return description;
    }

    function getUrl() public view returns (string) {
        return url;
    }

    function getProperties() public view returns (string, string, string) {
        return (name, description, url);
    }

}