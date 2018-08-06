pragma solidity ^0.4.24;

import './lib/MultiSigWallet.sol';

/**
 *  The Multisignature wallet contract of SON project
 */

contract SonFund is MultiSigWallet {
    function SonFund(address[] _owners, uint _required) 
        public
        validRequirement(_owners.length, _required)
        MultiSigWallet(_owners, _required){
        }
}