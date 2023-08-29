pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";
import "../node_modules/@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract MyToken is ERC20Capped, Ownable, ReentrancyGuard {

    constructor() ERC20("MYToken", "MTk") ERC20Capped(1000*10**18) {
        
    }

    function minting(address rec, uint256 amount) external onlyOwner {
        _mint(rec, amount);
    }

    function burn(uint256 amount) public virtual {
        _burn(_msgSender(), amount);
    }

      function burnFrom(address account, uint256 amount) public virtual {
        _spendAllowance(account, _msgSender(), amount);
        _burn(account, amount);
    }
}