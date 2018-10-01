pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/payment/Escrow.sol";
import "openzeppelin-solidity/contracts/payment/PullPayment.sol";
import "openzeppelin-solidity/contracts/payment/RefundEscrow.sol";
import "openzeppelin-solidity/contracts/payment/SplitPayment.sol";

contract EscrowStore is Escrow, PullPayment, RefundEscrow, SplitPayment {
  constructor() {
    
  }
}
