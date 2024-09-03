import { ethers, upgrades } from "hardhat";

const PROXY = "";

async function main() {
  const BoxV2 = await ethers.getContractFactory("BoxV2");
  console.log("Upgrading Pizza Box...");
  await upgrades.upgradeProxy(PROXY, BoxV2);
  console.log("Box upgraded");
}

main();
