pragma solidity >=0.4.0 <0.7.0;

contract Token {
    
    string public constant name = "OyincodeToken";
    string public constant symbol = "OTH";
    uint8 public constant decimals = 0;
    uint256 totalSupply_;
    
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    
    constructor(uint256 total) public {
        total = totalSupply_;
        balances[msg.sender] = totalSupply_;
    }
    
    
    function totalSupply() public view returns (uint256);
    function balanceOf(address tokenOwner) public view returns (uint);
    function allowance(address tokenOwner, address spender)
    public view returns (uint);
    function transfer(address to, uint tokens) public returns (bool);
    function approve(address spender, uint tokens)  public returns (bool);
    function transferFrom(address from, address to, uint tokens) public returns (bool);
    
    // events are solidity's way of notifying the client of occurences within the contract
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);
}