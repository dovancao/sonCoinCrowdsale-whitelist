pragma solidity 0.4.24;

import './SonCoin.sol';
import './WhitelistedCrowdsale.sol';
import 'zeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol';
import 'zeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol';


contract SonCoinCrowdsale is MintedCrowdsale , TimedCrowdsale, WhitelistedCrowdsale {
    function SonCoinCrowdsale
        (
            uint256 _openingTime,
            uint256 _closingTime,
            uint256 _rate,
            address _wallet,
            address[] _whiteList,
            MintableToken _token
        )
        public
        Crowdsale(_rate, _wallet, _token)
        TimedCrowdsale(_openingTime, _closingTime) 
        WhitelistedCrowdsale(_whiteList)
        {
        }
}



