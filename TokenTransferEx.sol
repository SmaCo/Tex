pragma solidity ^0.4.4;

// this interface is needed for calling other deployed smart contracts
contract ExternalTokenInterface{
// these are standard ERC20 token functions
	function transfer(address _to, uint256 _amount) public returns (bool)	{  }
	function balanceOf(address _owner) public constant returns (uint256) {  }
}

// this is the actual contract, that helps get out the tokens accidentally sent to your smart contract 
// (or for rescuing tokens from AirDrops)
contract TokenTransferEx{
	address owner;
	modifier isContractOwner(){
			require(msg.sender == owner);
			_;
	}

	function TokenTransferEx() public
	{
			owner = msg.sender;
	}

	function transferExternalTokenAllToOwner(address externalTokenContractAddress) 
		isContractOwner
		public
		returns(bool result)
	{
		// use the interface to access the external token smart contract
		ExternalTokenInterface externalToken = ExternalTokenInterface(externalTokenContractAddress);
		uint256 amountOfExternalTokens = externalToken.balanceOf(address(this));
		result = externalToken.transfer(owner, amountOfExternalTokens);
		return result;
	}

	// select how many tokens are to be transferred to whom
	function transferExternalToken(address externalTokenContractAddress, address _to, uint256 _amount) 
		isContractOwner
		public
		returns(bool result)
	{
		// use the interface to access the external token smart contract
		ExternalTokenInterface externalToken = ExternalTokenInterface(externalTokenContractAddress);
		uint256 amountOfExternalTokens = externalToken.balanceOf(address(this));
		// the amount should be more or equal
		require(_amount <= amountOfExternalTokens);
		result = externalToken.transfer(_to, _amount);
		return result;
	}
	
}
