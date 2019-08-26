pragma solidity >=0.4.0 <0.7.0;

contract OyincodeToken{
    
    mapping(address => uint256) balanceOf;
    uint256 initialAmount; 
    
    constructor() public {
        balanceOf[msg.sender] = initialAmount;
    }
    
    function transferToken(address _to, uint256 value) public {
        if(balanceOf[msg.sender] < value)revert();
        if(balanceOf[_to] + value < balanceOf[_to])revert();
        balanceOf[msg.sender] -= value;
        balanceOf[_to] += value;
    }
}
