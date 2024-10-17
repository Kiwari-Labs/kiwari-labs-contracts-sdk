// SPDX-License-Identifier: Apache-2.0
pragma solidity >=0.5.0 <0.9.0;

import "./interfaces/IERC20Burnable.sol";
import "./interfaces/IERC20Mintable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@kiwarilabs/contracts/abstracts/ERC20EXPBase.sol";

contract PointToken is ERC20EXPBase, IERC20Burnable, IERC20Mintable, Ownable {
    uint8 private _decimals;

    constructor(
        address _owner,
        string memory _name,
        string memory _symbol,
        uint8 decimals_,
        uint16 blockTime_,
        uint8 frameSize_,
        uint8 slotSize_
    )
        ERC20EXPBase(
            _name,
            _symbol,
            block.number,
            blockTime_,
            frameSize_,
            slotSize_
        )
        Ownable(_owner)
    {
        _decimals = decimals_;
    }

    function decimals() public view override returns  (uint8) {
        return _decimals;
    }

    function mint(address to, uint256 value) public override onlyOwner {
        _mint(to, value);
    }

    function burn(address from, uint256 value) public override onlyOwner {
        _burn(from, value);
    }
}
