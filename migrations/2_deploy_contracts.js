const SonCoinCrowdsale = artifacts.require('./SonCoinCrowdsale.sol');
const SonCoin = artifacts.require('./SonCoin.sol');
const WhitelistedCrowdsale = artifacts.require('./WhitelistedCrowdsale.sol');

module.exports = function(deployer, network, accounts) {
    const openingTime = web3.eth.getBlock('latest').timestamp + 2; // two secs in the future
    const closingTime = openingTime + 86400 * 20; // 20 days
    const rate = new web3.BigNumber(1000);
    const wallet = accounts[1];
    const whiteList = [
        "0xaaaaaa",
        "0xbbbbbb",
        "0xcccccc"
    ];

    return deployer
        .then(() => {
            return deployer.deploy(SonCoin);
        })
        .then(() => {
            return deployer.deploy(
                SonCoinCrowdsale,
                openingTime,
                closingTime,
                rate,
                wallet,
                whiteList,
                SonCoin.address
            );
        })
        .then(() => {
            return deployer.deploy(
                WhitelistedCrowdsale[whiteList]
            )
        }
    )
};