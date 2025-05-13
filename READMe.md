This is a collection of 1 image and metadata for 1 NFT.
For SimleNFT smart contract

- image url: https://raw.githubusercontent.com/samkoh-gambit/simple-nft/main/images/1.png
- metadata url: https://raw.githubusercontent.com/samkoh-gambit/simple-nft/main/metadata/1.json

Commands to run the compilation, deployement and verifications

1. Compile smart contract

```
npx hardhat compile
```

2. Deploy smart contract

```
npx hardhat run scripts/deploy.js --network polygon_amoy
```

3. Smart contract verification

```
npx hardhat verify --network polygon_amoy [SMART CONTRACT ADDRESS]] "http://abc/"
```
