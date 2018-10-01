pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract GetClue is StandardToken, MintableToken {
    string public name;
    string public symbol;
    uint public decimals;

    constructor(string _name, string _symbol, uint _decimals) MintableToken() public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        owner = msg.sender;
    }

    function kill() public {
        if(msg.sender === owner) { selfdestruct(owner); }
    }
}