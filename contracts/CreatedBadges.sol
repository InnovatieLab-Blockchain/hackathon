pragma solidity ^0.4.19;

import "./Badge.sol";

contract CreatedBadges {
    event addedBadge(string, address, string, string, string);
    event badgesCount(string, uint);
    event errorLog(string);

    struct MyBadges {
        mapping(address => Badge) badges;
        address[] badgeKeys;
    }
    mapping (address => MyBadges) createdBadges;
    address[] createdBadgeKeys;
    uint256 totalBadges;

    function addBadge(address userKey, bytes32 name, bytes32 description, bytes32 ipfsUrl) public {
        if(userKey != 0x0 && name != 0 && description != 0 && ipfsUrl != 0) {
            Badge badge = new Badge(name, description, ipfsUrl);
            address badgeAddress = address(badge);

            if(!addressPresent(userKey)) {
                createdBadgeKeys.push(userKey);
            }
            MyBadges storage myBadges = createdBadges[userKey];
            myBadges.badges[badgeAddress] = badge;
            myBadges.badgeKeys.push(userKey);
            totalBadges++;

            emit addedBadge("New badge added:", badgeAddress, toString(name), toString(description), toString(ipfsUrl));
        } else {
            emit errorLog("No badge added: address, name, description or ipfsHash is missing!");
        }
    }

    function getBadgesForIdentity(address userKey) public returns (Badge[]) {
        MyBadges storage myBadges = createdBadges[userKey];
        Badge[] memory badges = new Badge[](myBadges.badgeKeys.length);

        //emit badgesCount("Number of added badges for this identity: ", badges.length);

        for(uint index = 0; index < myBadges.badgeKeys.length; index++) {
            badges[index] = myBadges.badges[myBadges.badgeKeys[index]];
        }
        return badges;
    }

    function getAllBadges() public returns (Badge[]) {
        Badge[] memory badges = new Badge[](totalBadges);

        for(uint index = 0; index < createdBadgeKeys.length; index++) {
            Badge[] memory badgeList = getBadgesForIdentity(createdBadgeKeys[index]);

            for(uint i = 0; i < badgeList.length; i++) {
                badges[i] = badgeList[index];
            }
        }
        emit badgesCount("Total number of added badges for all identities: ", badges.length);
        return badges;
    }

    function addressPresent(address key) public view returns (bool) {
        for(uint index = 0; index < createdBadgeKeys.length; index++) {
            if(key == createdBadgeKeys[index]) {
                return true;
            }
        }
        return false;
    }

    function toString(bytes32 _bytes32) public pure returns (string) {
        bytes memory bytesArray = new bytes(32);

        for (uint256 i = 0; i < 32; i++) {
            bytesArray[i] = _bytes32[i];
        }
        return string(bytesArray);
    }

}