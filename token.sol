pragma solidity >=0.4.0 <0.7.0;

contract Token {
    
    string public constant name = "OyincodeToken";
    string public constant symbol = "OTH";
    uint8 public constant decimals = 0;
    uint public numOfTokens;
    uint256 totalSupply_;
    
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    
    constructor(uint256 total) public {
        total = totalSupply_;
        balances[msg.sender] = totalSupply_;
    }
     
    modifier ownerOnly(){
        require(numOfTokens <= balances[msg.sender], "Only owner can perform this action");
        _;
    }
    
    // get token supply
    function totalSupply() public view returns (uint256) {
      return totalSupply_;
    }
    // get balance of owner's account
    function balanceOf(address tokenOwner) public view returns (uint) {
      return balances[tokenOwner];
    }
    
    //transfer number of tokens, only owner can perform this action
    function transfer(address receiver, uint numTokens) public ownerOnly returns  (bool) {
      numTokens = numOfTokens;
      balances[msg.sender] = balances[msg.sender] - numTokens;
      balances[receiver] = balances[receiver] + numTokens;
      emit Transfer(msg.sender, receiver, numTokens);
      return true;
    }
    
    function allowance(address tokenOwner, address spender)
    public view returns (uint);
    function approve(address spender, uint tokens)  public returns (bool);
    function transferFrom(address from, address to, uint tokens) public returns (bool);
    
    // events are solidity's way of notifying the client of occurences within the contract
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);
}