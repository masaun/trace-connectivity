const TraceConnectivityRegistry = artifacts.require("./TraceConnectivityRegistry.sol");

module.exports = function(deployer) {
  deployer.deploy(TraceConnectivityRegistry);
};
