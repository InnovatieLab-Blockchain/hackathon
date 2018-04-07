pragma solidity ^0.4.19;

import "./Badge.sol";

contract CreatedBadges {

    struct BadgeElement {
        address previous;
        address next;
        Badge badge;
    }
    uint size;
    address head;
    address tail;
    mapping (address => BadgeElement) badges;
    address[] badgeAddresses;

    function getAllAddresses() public view returns (address[]) {
        return badgeAddresses;
    }

    function getAllBadges() public view returns (Badge[]) {
        Badge[] memory badgeList = new Badge[](size);

        for(uint index = 0; index < badgeAddresses.length; index++) {
            badgeList[index] = badges[badgeAddresses[index]].badge;
        }
        return badgeList;
    }

    function getBadge(address key) public view returns (Badge) {
        return badges[key].badge;
    }

    function addBadge(address key, bytes badgeName, bytes badgeDescription, bytes badgeIpfs) public returns (bool) {
        Badge badge = new Badge(badgeName, badgeDescription, badgeIpfs);

        BadgeElement storage badgeElement = badges[key];

        if(badgeElement.badge != Badge(0x0)) {
            return false;
        }
        badgeElement.badge = badge;
        badgeAddresses.push(key);

        if(size == 0){
            tail = key;
            head = key;
        } else {
            badges[head].next = key;
            badgeElement.previous = head;
            head = key;
        }
        size++;
        return true;
    }

    function removeBadge(address key) public returns (bool result) {
        BadgeElement storage badgeElement = badges[key];

        if(badgeElement.badge == Badge(0x0)) {
            return false;
        }
        if(size == 1) {
            tail = 0x0;
            head = 0x0;
        } else if (key == head) {
            head = badgeElement.previous;
            badges[head].next = 0x0;
        } else if(key == tail){
            tail = badgeElement.next;
            badges[tail].previous = 0x0;
        } else {
            address prevElem = badgeElement.previous;
            address nextElem = badgeElement.next;
            badges[prevElem].next = nextElem;
            badges[nextElem].previous = prevElem;
        }
        size--;
        delete badges[key];

        for(uint index = 0; index < badgeAddresses.length; index++) {
            if(key == badgeAddresses[index]) {
                delete badgeAddresses[index];
            }
        }
        return true;
    }
}