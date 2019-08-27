pragma solidity >=0.4.0 <0.7.0;

contract OyincodeToken{
    
    mapping(address => uint256) balanceOf;
    uint256 initialAmount = 100 wei; 
    address payable owner;
    address payable recipient;
    
    modifier ownerOnly(){
        require(owner == msg.sender, "Only Owner can transfer tokens");
        _;
    }
    constructor() public {
        owner = msg.sender;
        balanceOf[owner] = initialAmount;
    }
    
    // transfer token function
    function transferToken(address payable _to, uint256 value) public payable ownerOnly {
        // equate the global recipient address to the local (_to)
        recipient = _to;
        //conditions for token transfer
        if(balanceOf[owner] < value)revert("Owner's balance must not be less than value to be transferred");
        if(balanceOf[recipient] + value < balanceOf[recipient])revert("Recipient's balance must be more than former state");
        //reduce the sender's balance
        balanceOf[owner] -= value;
        //increase the recipient's balance
        balanceOf[recipient] += value;
    }
    
    // view owner balance function
    function viewOwnerBalance() public view returns(uint256 _owner){
        _owner = balanceOf[msg.sender];
    }
    // view recipient balance function
    function viewRecipientBalance() public view returns(uint256 _recipient){
        _recipient = balanceOf[recipient];
    }
}
