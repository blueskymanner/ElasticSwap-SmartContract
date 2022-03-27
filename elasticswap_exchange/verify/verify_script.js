// import console from "console";
const console = require("console");
const hre = require("hardhat");


async function main() {
  await hre.run('verify:verify', {
    address: "0xD7F8E3551fA6f36daB32331acE6ebe6D84d2425b",
    constructorArguments: [
    ],
    contract: "src/libraries/SafeMetadata.sol:SafeMetadata"
  })
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })