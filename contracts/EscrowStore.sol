pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/payment/Escrow.sol";
import "openzeppelin-solidity/contracts/payment/PullPayment.sol";
import "openzeppelin-solidity/contracts/payment/RefundEscrow.sol";
import "openzeppelin-solidity/contracts/payment/SplitPayment.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract EscrowStore is Escrow, PullPayment, RefundEscrow, SplitPayment {
	using SafeMath for uint256;

	uint256 public minimumBet;
	uint256 public totalBet;
	uint256 public numberOfBets;
	uint256 public maxAmountofBets = 100; 
	address[] public players;

	struct player {
		uint256 amountBet;
		string[] cardSelected;
	}

	mapping(adress => player) public playerInfo;

	constructor(uint256 _minimumBet) PullPayment() {
		if(_minimumBet != 0) minimumBet = _minimumBet;
    }


	mapping(address => uint256) public onBetMoney;

	function checkPlayerExits(address _player) public view returns(bool) {
		for(uint256 i = 0; i < players.length;  i++) {
			if(players[i] == _player) {return true;}
			return false;
		}
	}

	function makeBet(uint256 _cardSelected) public payable {
		require(!checkPlayerExits(msg.sender));
		require(numberOfBets < maxAmountofBets);
		require(msg.value >= minimumBet);

		onBetMoney[_player] = msg.value;
		Escrow.deposit(msg.value);

		playerInfo[msg.sender].amountBet = msg.value;
		playerInfo[msg.sender].cardSelected = _cardSelected;
		players.push(msg.sender);

		totalBet = totalBet.add(_bet);
		numberOfBets = numberOfBets.add(1);
	}
}
