import { ethers } from "ethers";

function randomWallet() {
  const wallet = ethers.Wallet.createRandom();

  console.log('wallet address: ', wallet.address);
  console.log('wallet private key: ', wallet.privateKey);
  console.log('wallet mnemonic phrase: ', wallet.mnemonic?.phrase);
}

function importedWallet() {
  const privateKey = '0x3833bce79902263b9bb2f4d3ff2b35747d07d3241cae5de239a7fc94ac4ff1eb';
  const mnemonicPhrase = 'educate olympic omit voyage soft picnic manage mass begin absent differ damp';

  const walletFromPrivateKey = new ethers.Wallet(privateKey);
  console.log('wallet from private key, address: ', walletFromPrivateKey.address);
  console.log('wallet from private key, private key: ', walletFromPrivateKey.privateKey);

  const walletFromMnemonicPhrase = ethers.Wallet.fromPhrase(mnemonicPhrase);
  console.log('wallet from mnemonic, address: ', walletFromMnemonicPhrase.address);
  console.log('wallet from mnemonic, private key: ', walletFromMnemonicPhrase.privateKey);
  console.log('wallet from mnemonic, mnemonic phrase: ', walletFromMnemonicPhrase.mnemonic?.phrase);
}

async function main() {
  // randomWallet();
  importedWallet();
}

main().catch(error => {
  console.log('error: ', error);
  process.exit(1);
});
