var badge = artifacts.require("./Badge.sol");
var createdbadges = artifacts.require("./CreatedBadges.sol");

module.exports = function (deployer) {

    deployer.deploy(badge, 'Atheneum', 'VWO profiel Cultuur en Maatschappij', 'QmYmHV9cGVRkh78TBKgvCBkDdP9B5cdBybDs7evbfFHCvN');
    deployer.deploy(createdbadges);

};