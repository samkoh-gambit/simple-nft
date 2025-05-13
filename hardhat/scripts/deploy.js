async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  // Hardcoded URI
  const baseURI = "http://abc/";

  const Contract = await ethers.getContractFactory("SimpleNFT");
  const contract = await Contract.deploy(baseURI);

  await contract.waitForDeployment();
  console.log("Contract deployed to:", contract.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
