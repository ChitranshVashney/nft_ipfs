const { network, ethers } = require("hardhat")

module.exports = async ({ getNamedAccounts }) => {
    const { deployer } = await getNamedAccounts()
    const chainId = network.config.chainId

    // Basic NFT
    const basicNft = await ethers.getContract("BasicNft", deployer)
    const basicMintTx = await basicNft.mintNft('https://ipfs.io/ipfs/QmNnMVA74JU4kEjbzhFe4n1gtEJC85djDKG6zqP2QKUuqb?filename=Ninjatic.full.571768.jpg')
    await basicMintTx.wait(1)
    console.log(`Basic NFT index 0 tokenURI: ${await basicNft.tokenURI(0)}`)
}

module.exports.tags = ["all", "mint"]