pragma solidity ^0.4.19;

import "truffle/Assert.sol";
import "../contracts/Badge.sol";
import "../contracts/BadgeCreator.sol";
import "../contracts/CreatedBadges.sol";

contract CreatedBadgesTest {

    function testCreatedBadges() public {

        BadgeCreator creator1 = new BadgeCreator('2ojKNym3x16kUNQPq32CNcRpuo8MDH5w5vQ', 'RuG');
        BadgeCreator creator2 = new BadgeCreator('2ojKNym3x16kUNQPq32CNcRpuo8MDH5w5vQ', 'RuG');
        Badge badge1 = new Badge('Atheneum', 'VWO profiel Cultuur en Maatschappij', 'QmAtheneum');
        Badge badge2 = new Badge('Havo', 'HAVO profiel algmeen', 'QmHavo');

        CreatedBadges cb = new CreatedBadges();
        cb.addBadge(creator1, badge1);
        cb.addBadge(creator2, badge2);

        Assert.equal(cb.getBadge(creator1), badge1);
        Assert.equal(cb.getBadge(creator2), badge2);

    }
}