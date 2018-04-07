var badgecreator = artifacts.require("./BadgeCreator.sol");
var badge = artifacts.require("./Badge.sol");
var createdbadges = artifacts.require("./CreatedBadges.sol");

module.exports = function (deployer) {

    deployer.deploy(badgecreator, '2ojKNym3x16kUNQPq32CNcRpuo8MDH5w5vQ', 'RuG');
    deployer.deploy(badge, 'Atheneum', 'VWO profiel Cultuur en Maatschappij', 'QmYmHV9cGVRkh78TBKgvCBkDdP9B5cdBybDs7evbfFHCvN');
    deployer.deploy(createdbadges);

};