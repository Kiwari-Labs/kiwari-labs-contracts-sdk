# Token-service-contracts

## Overview  
Token service is a smart contract that implementing factory pattern for creating a new asset on DLT-based Loyalty Platform.

## Prerequisite  
- node [Download](https://nodejs.org/en/)
- nvm [Download](https://github.com/nvm-sh/nvm#installing-and-updating)
- git [Download](https://git-scm.com/)

```shell
git clone https://github.com/Kiwari-Labs/token-service-contracts.git
cd token-service-contracts
```

## Installing  
To install all necessary packages and dependencies in the project, run command
```
yarn install
```

## Compile the code
To compile the smart contracts, run command
```
yarn compile
```

## Testing
To run the tests and ensure that the contracts behave as expected, run command
```
yarn test
```

## Deploying
The following commands are used to deploy the contracts to different environments:
### Production Environments
```
yarn deploy:prod
```
### Staging Environments
for staging deployment  
```
yarn deploy:stg
```

## Environment Configuration
Before deploying, ensure that your environment variables are properly configured. Typically, this involves setting up variables for network endpoints, private keys, and other deployment-specific settings. These configurations are often stored in a `.env` file.

Example `.env` file:

```
NETWORK_URL=http://localhost:8545
PRIVATE_KEY=your_private_key
```

## Support and Issue
For support or any inquiries, feel free to reach out to us at [github-issue](https://github.com/Kiwari-Labs/token-service-contracts/issues) or kiwarilabs@protonmail.com

## License
This project is licensed under the Apache-2.0 License. See the [LICENSE](LICENSE) file for more details.