pragma solidity >=0.4.0 <0.7.0;

contract OyincodeToken{
    
    mapping(address => uint256) balanceOf;
    uint256 initialAmount = 100 wei; 
    address payable owner;
    
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
        if(balanceOf[owner] < value)revert("Owner's balance must not be less than value to be transferred");
        if(balanceOf[_to] + value < balanceOf[_to])revert("Recipient's balance must be more than former state");
        balanceOf[owner] -= value;
        balanceOf[_to] += value;
    }
    
    // view owner balance function
    function viewOwnerBalance() public view returns(uint256 _owner){
        _owner = balanceOf[msg.sender];
    }
}
