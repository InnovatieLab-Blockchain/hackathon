pragma solidity ^0.4.18;

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

    function addBadge(address userKey, string name, string description, string ipfsUrl) public {
        Badge badge = new Badge(name, description, ipfsUrl);
        address badgeAddress = address(badge);

        if(!addressPresent(userKey)) {
            createdBadgeKeys.push(userKey);
        }
        MyBadges storage myBadges = createdBadges[userKey];
        myBadges.badges[badgeAddress] = badge;
        myBadges.badgeKeys.push(userKey);
        totalBadges++;

        addedBadge("New badge added:", badgeAddress, name, description, ipfsUrl);
    }

    function getBadgesForIdentity(address userKey) public view returns (Badge[]) {
        MyBadges storage myBadges = createdBadges[userKey];
        Badge[] memory badges = new Badge[](myBadges.badgeKeys.length);

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
        badgesCount("Total number of added badges for all identities: ", badges.length);
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


}