pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/payment/Escrow.sol";
import "openzeppelin-solidity/contracts/payment/PullPayment.sol";
import "openzeppelin-solidity/contracts/payment/RefundEscrow.sol";
import "openzeppelin-solidity/contracts/payment/SplitPayment.sol";

contract EscrowStore is Escrow, PullPayment, RefundEscrow, SplitPayment {
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

	function makeBet(address _player, uint256 _bet) public payable {
		onBetMoney[_player] = _bet;
		Escrow.deposit(_bet);
	}
}
