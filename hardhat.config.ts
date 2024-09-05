import "@nomicfoundation/hardhat-toolbox";
import { HardhatUserConfig } from "hardhat/config";
import * as dotenv from "dotenv";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.20",
    settings: {
      evmVersion: "london",
    },
  },
  ignition: {
    requiredConfirmations: 1,
  },
  networks: {
    "staging": {
      url: process.env.STG_RPC_URL,
      gasPrice: "auto",
      gas: "auto",
      accounts:
        process.env.STG_PRIVATE_KEY !== undefined ? [process.env.STG_PRIVATE_KEY] : [],
    },
    "production": {
      url: process.env.PROD_RPC_URL,
      gasPrice: "auto",
      gas: "auto",
      accounts:
        process.env.PROD_PRIVATE_KEY !== undefined ? [process.env.PROD_PRIVATE_KEY] : [],
    }
  },
};

export default config;
