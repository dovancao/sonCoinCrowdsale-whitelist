pragma solidity 0.4.24;

import 'zeppelin-solidity/contracts/token/ERC20/MintableToken.sol';

contract SonCoin is MintableToken {
    string public name = "SON COIN";
    string public symbol = "SCON";
    uint8 public decimals = 18;
}