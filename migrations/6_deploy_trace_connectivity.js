const TraceConnectivity = artifacts.require("./TraceConnectivity.sol");

module.exports = function(deployer) {
  deployer.deploy(TraceConnectivity);
};
