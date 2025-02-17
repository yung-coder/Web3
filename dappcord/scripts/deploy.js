const hre = require("hardhat")

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

async function main() {

  const [deployer] = await ethers.getSigners();
  const NAME = "Dappcord"
  const SYMBOL = "DC"

  // deploy cntracts 
  const Dappcord = await ethers.getContractFactory("Dappcord")
  const dappcord = await Dappcord.deploy(NAME, SYMBOL)
  await dappcord.deployed()

  // Create 3 Channels 
  const CHANNEL_NAMES = ["general", "intro", "jobs"]
  const COSTS = [tokens(1), tokens(0), tokens(0.25)]

  for (let i = 0; i < 3; i++) {
    const transcation = await dappcord.connect(deployer).createChannel(CHANNEL_NAMES[i], COSTS[i])
    await transcation.wait()
  }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});