# Tex
You want your smart contract to be able to forward ERC 20 tokens it has received?
Add this to your smart contract in order to get out ethereum tokens sent to your contract address

## Why Tex
If you are into Ethereum, tokens and smart contracts, you might know about the issue: when ERC20 tokens are sent to an address not owned by a "person" but by a smart contract, you can't get them out anymore.
For example:
This is the address of the smart contract that provides the EOS token.
https://etherscan.io/address/0x86fa049857e0209aa7d9e616f7eb3b3b78ecfdb0
If you see on the upper right, this smart contracts owns a lot of other tokens.

Standard ERC20 implementation do not provide means of moving those tokens, thus, having a real value blocked.

In order to solve this, you can use the code provided in this repository.
It adds the possibility to your smart contract, to call a standard ERC20 token, and to move the funds.

Beware: if the ERC20 standard is updated or changed, this code won't be working anymore.

## Usage
Just import this file at the top of your contract:

`import "TokenTransferEx.sol";`

Try this out locally in Remix and on a testnet before deploying to mainnet.

## Thanks for the inspiration
Many thanks to these guys here for inspiration:
* http://catallax.info/news/2017/6/8/calling-future-contracts-from-contracts-in-ethereum-dev-log-6
* https://ethereum.stackexchange.com/questions/24713/how-can-a-deployed-contract-call-another-deployed-contract-by-interface-and-ad
* (I'll have to sort through the sources ;) )

## What about the name of this repository?
Well, it comes from "TransferExternal", and has a loose reference to [Tex Willer](https://en.wikipedia.org/wiki/Tex_Willer)
