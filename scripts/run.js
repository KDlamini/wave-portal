const main = async () => {
    const [owner, randomPerson] = await hre.ethers.getSigners();
    const waveContractFactory = await hre.ethers.getContractFactory("SmartPortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();

    console.log("Contract deployed to:", waveContract.address);
    console.log("Contract deployed by:", owner.address);

    const firstWaveTxn = await waveContract.wave(owner.address, "Deadpool", 1);
    await firstWaveTxn.wait();
  
    await waveContract.getWaveStatus();
  
    const secondWaveTxn = await waveContract.connect(randomPerson).wave(owner.address, "Batman", 4);
    await secondWaveTxn.wait();
  
    await waveContract.getWaveStatus();
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0); // exit Node process without error
    } catch (error) {
      console.log(error);
      process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
    }
    // Read more about Node exit ('process.exit(num)') status codes here: https://stackoverflow.com/a/47163396/7974948
  };
  
  runMain();