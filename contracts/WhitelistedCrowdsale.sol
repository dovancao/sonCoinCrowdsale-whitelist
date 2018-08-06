pragma solidity ^0.4.24;

import 'zeppelin-solidity/contracts/crowdsale/Crowdsale.sol';
import 'zeppelin-solidity/contracts/math/SafeMath.sol';

/**
 * @title WhitelistedCrowdsale
 * @dev Extension of Crowdsale with the whitelist of specific members.
 */

contract WhitelistedCrowdsale is Crowdsale {
    using SafeMath for uint256;

    /**
     * Amount of pre sale limitation per member
     * Could not add to Crowdsale.json because of EVM said stack too deep.
     */
    uint256 constant MAX_WEI_RAISED = 5 ether;
    mapping (address => bool) public whitelist;
    mapping (address => uint256) public memberWeiRaised;

    function WhitelistedCrowdsale(address[] _whiteList) public {
        for (uint i = 0; i< _whiteList.length; i++){
            whitelist[_whiteList[i]] = true;
            memberWeiRaised[_whiteList[i]] = 0;
        }
    }

    // check token amount limitation of member
    function checkLimit(uint256 _weiAmount) internal {
        if (memberWeiRaised[msg.sender].add(msg.value) > MAX_WEI_RAISED) {
            revert();
        }
        memberWeiRaised[msg.sender] = memberWeiRaised[msg.sender].add(msg.value);
    }

    /** return true if address whiteListed member */
    function isWhiteListMember(address _member) public constant returns(bool) {
        return whitelist[_member] == true;
    }
}