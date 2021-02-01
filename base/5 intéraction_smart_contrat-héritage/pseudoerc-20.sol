pragma solidity ^0.8.1;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) {
        name = _name;
    }

    function mint() public virtual {
        balances[msg.sender] ++;
    }
}

contract MyToken is ERC20Token {
    string public symbol;
    address[] public owners;
    uint256 public ownerCount;

    constructor (
        string memory _name,
        string memory _symbol
    )
        ERC20Token(_name)
    {
        symbol = _symbol;
    }

    function mint() public override {
        super.mint();
        ownerCount ++;
        owners.push(msg.sender);
    }

}