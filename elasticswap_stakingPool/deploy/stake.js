module.exports = async ({ getNamedAccounts, deployments }) => {
  const { deploy, log } = deployments;
  const namedAccounts = await getNamedAccounts();
  const { admin } = namedAccounts;

  const deployResult = await deploy("Stake", {
    from: admin,
    contract: "Pool",
    args: [],
  });
  if (deployResult.newlyDeployed) {
    log(
      `Library Stake deployed at ${deployResult.address} using ${deployResult.receipt.gasUsed} gas`
    );
  }
};
module.exports.tags = ["Stake"];
