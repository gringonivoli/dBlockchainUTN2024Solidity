import { env } from "process";
import { ethers, upgrades } from "hardhat";
import dotenv from "dotenv";

dotenv.config();


const { OWNER_ADDRESS } = env;


async function main () {
    const Pizza = await ethers.getContractFactory('Pizza');
    console.log('Deploying Pizza...');
    const pizza = await upgrades.deployProxy(Pizza, [7, OWNER_ADDRESS], { initializer: 'initialize' });
    await pizza.waitForDeployment();
    console.log('Pizza deployed to:', await pizza.getAddress());
}

main();
