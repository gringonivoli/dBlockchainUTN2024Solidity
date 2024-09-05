import { ethers, upgrades } from "hardhat";

const PROXY = "0xD536e6a9d490f258c6C0cc6386fD7D93150276aD"

async function main() {
  const PizzaV2 = await ethers.getContractFactory("PizzaV2");
  console.log("Upgrading Pizza...");
  await upgrades.upgradeProxy(PROXY, PizzaV2);
  console.log("Pizza upgraded successfully");
}

main();
