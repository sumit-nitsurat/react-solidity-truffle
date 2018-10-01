var EscrowStore = artifacts.require("./EscrowStore.sol");

module.exports = function(deployer) {
  deployer.deploy(EscrowStore);
};
