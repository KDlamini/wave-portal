const main = async () => {
  const waveContractFactory = await hre.ethers.getContractFactory("SmartPortal");
  const waveContract = await waveContractFactory.deploy();
  await waveContract.deployed();
  console.log("Contract add:", waveContract.address);

 
  let waveTxn = await waveContract.wave("Deadpool", 1, "A message!");
  await waveTxn.wait(); // Wait for the transaction to be mined

  await waveContract.getWaveStatus();

  const [_, randomPerson] = await hre.ethers.getSigners(); // Connect new user 

  waveTxn = await waveContract.connect(randomPerson).wave("Batman", 4, "Another message!");
  await waveTxn.wait(); // Wait for the transaction to be mined

  await waveContract.getWaveStatus();

  let allWaves = await waveContract.getAllWaves();
  console.log(allWaves);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();