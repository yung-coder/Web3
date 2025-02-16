const { expect } = require("chai")
const { ethers } = require("hardhat")

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

describe("Dappcord", function () {
  let dappcord

  const NAME = "Dappcord"
  const SYMBOL = "DC"

  this.beforeEach(async () => {
    [deployer, user] = await ethers.getSigners()
    const Dappcord = await ethers.getContractFactory("Dappcord")
    dappcord = await Dappcord.deploy(NAME, SYMBOL)

    // create a channel 
    const transition = await dappcord.connect(deployer).createChannel("general", tokens(1))
    await transition.wait()
  })

  describe("Deployment", function () {
    it("Sets the name", async () => {
      let result = await dappcord.name()
      expect(result).to.equal(NAME)
    })


    it("Sets the Symbol", async () => {
      let result = await dappcord.symbol()
      expect(result).to.equal(SYMBOL)
    })


    it("Sets the owner", async () => {
      let result = await dappcord.owner()
      expect(result).to.equal(deployer.address)
    })
  })


  describe("Creating Channels", function () {
    it("Returns total channels", async () => {
      const result = await dappcord.totalChannels()
      expect(result).to.be.equal(1)
    })


    it("Returns channel attributes", async () => {
      const channel = await dappcord.getChannel(1)
      expect(channel.id).to.be.equal(1)
      expect(channel.name).to.be.equal("general")
      expect(channel.cost).to.be.equal(tokens(1))
    })
  })
})
