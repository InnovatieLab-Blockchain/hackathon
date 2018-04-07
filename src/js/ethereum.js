var web3Provider;

if (typeof web3 !== 'undefined') {
    web3Provider = web3.currentProvider;
} else {
    web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
}
web3 = new Web3(web3Provider);

var abi = JSON.parse("[{\"constant\":true,\"inputs\":[],\"name\":\"getAllAddresses\",\"outputs\":[{\"name\":\"\",\"type\":\"address[]\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[{\"name\":\"key\",\"type\":\"address\"}],\"name\":\"getBadge\",\"outputs\":[{\"name\":\"\",\"type\":\"address\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"key\",\"type\":\"address\"},{\"name\":\"badgeName\",\"type\":\"bytes\"},{\"name\":\"badgeDescription\",\"type\":\"bytes\"},{\"name\":\"badgeIpfs\",\"type\":\"bytes\"}],\"name\":\"addBadge\",\"outputs\":[{\"name\":\"\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"constant\":true,\"inputs\":[],\"name\":\"getAllBadges\",\"outputs\":[{\"name\":\"\",\"type\":\"address[]\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"key\",\"type\":\"address\"}],\"name\":\"removeBadge\",\"outputs\":[{\"name\":\"result\",\"type\":\"bool\"}],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]");
var contractAddress = "0x83dBd04c5841aD4231151C8CFEEB2A0949DEa90c";
var contract = web3.eth.contract(abi).at(contractAddress);

function storeBadge() {
    var creator = "het address van de badgecreator / ethereum address van uPort (niet de clientId)";
    var name = document.getElementById("badgeName");
    var description = document.getElementById("badgeDescription");
    var ipfsHash = "de hash die je als response terugkrijgt van IPFS na het opslaan van een afbeelding";

    contract.addBadge.sendTransaction(creator, name, description, ipfsHash, {
        from: web3.eth.accounts[0],
        gas:4000000 },
        function(error, result) {
            if(!error) {
                console.log(result);
            } else {
                console.error(error);
            }
    });

}

