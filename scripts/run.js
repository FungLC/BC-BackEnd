const main = async () => {
    const Light = await hre.ethers.getContractFactory("LightControl");
    const light = await Light.deploy();
    await light.deployed();
    console.log("light deployed to:", light.address);

    const PaymentContract = await hre.ethers.getContractFactory("PaymentContract");
    const paymentContract = await PaymentContract.deploy();
    await paymentContract.deployed();
    console.log("PaymentContract deployed to:", paymentContract.address);

    const ownerAddress = "0xa0Ee7A142d267C1f36714E4a8F75612F20a79720"; // Replace with your desired owner address
    const Hotel = await hre.ethers.getContractFactory("Hotel");
    const hotel = await Hotel.deploy(ownerAddress);
    await hotel.deployed();
    console.log("Hotel deployed to:", hotel.address);
}

main()
    .then(() => {
        console.log(`success!`);
        process.exit(0);
    })
    .catch((err) => {
        console.error(err);
        process.exit(1);
    })