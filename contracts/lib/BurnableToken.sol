pragma solidity ^0.4.24;

import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

/**
 * @title Burnable Token
 * @dev Token that can be irreversibly burned (destroyed).
 */

contract BurnableToken is StandardToken {
   /**
     * @dev Burns a specific amount of tokens.
     * @param _value The amount of token to be burned.
     */
    /** event to trigger log */
    event Burn(address indexed burner, uint indexed value);

    function burn(uint _value) public {
        require(_value > 0);
        address burner = msg.sender;
        balances[burner] = balances[burner].sub(_value);
        uint256 totalSupply =  totalSupply.sub(_value);
        Burn( burner, _value);
    }
}
