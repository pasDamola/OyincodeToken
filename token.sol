pragma solidity >=0.4.0 <0.7.0;
import "node_modules/openzeppelin-solidity/contracts/token/StandardToken.sol";

contract Token is ERC20Detailed, ERC20 {
    
    // string public constant name = "OyincodeToken";
    // string public constant symbol = "OTH";
    // uint8 public constant decimals = 0;
    uint256 totalSupply_;
    
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    

    
    constructor(uint256 total) public {
        totalSupply_ = total;
        balances[msg.sender] = total;
    }
    
     // events are solidity's way of notifying the client of occurences within the contract
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);
    
    // get token supply
    function totalSupply() public view returns (uint256) {
      return totalSupply_;
    }
    
    // get balance of owner's account
    function balanceOf(address tokenOwner) public view returns (uint) {
      return balances[tokenOwner];
    }
    
    //transfer number of tokens, only owner can perform this action
    function transfer(address receiver, uint numTokens) public returns (bool) {
      require(numTokens <= balances[msg.sender], "Owner's balance must be more than number of tokens being sent");
      balances[msg.sender] = balances[msg.sender].add(numTokens);
      balances[receiver] = balances[receiver].add(numTokens);
      emit Transfer(msg.sender, receiver, numTokens);
      return true;
    }
    
    // owner approves of delegate accounts to withdraw tokens
    function approve(address delegate, uint numTokens) public returns (bool) {
      allowed[msg.sender][delegate] = numTokens;
      emit Approval(msg.sender, delegate, numTokens);
      return true;
    }
    
    // Get Number of Tokens Approved for Withdrawal
    function allowance(address owner, address delegate) public view returns (uint) {
      return allowed[owner][delegate];
    }
    
    //Transfer Tokens by Delegate
    function transferFrom(address owner, address buyer, uint numTokens) public returns (bool) {
      require(numTokens <= balances[msg.sender], "Owner's balance must be more than number of tokens being sent");
      require(numTokens <= allowed[msg.sender][owner], "Delegate's balance must be more than the number of tokens being sent");
      balances[owner] = balances[owner].sub(numTokens);
      allowed[msg.sender][owner] = allowed[msg.sender][owner].sub(numTokens);
      balances[buyer] = balances[buyer].add(numTokens);
      emit Transfer(owner, buyer, numTokens);
      return true;
    }
    
    
   
}