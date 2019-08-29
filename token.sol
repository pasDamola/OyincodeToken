pragma solidity >=0.4.0 <0.7.0;

contract Token {


    string public constant name = "OyincodeToken";
    string public constant symbol = "OTH";
    uint8 public constant decimals = 0;

    function totalSupply() public view returns (uint256);
    function balanceOf(address tokenOwner) public view returns (uint);
    function allowance(address tokenOwner, address spender)
    public view returns (uint);
    function transfer(address to, uint tokens) public returns (bool);
    function approve(address spender, uint tokens)  public returns (bool);
    function transferFrom(address from, address to, uint tokens) public returns (bool);
    
    // events
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to,uint tokens);
}