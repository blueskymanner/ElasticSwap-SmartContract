// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.4;

import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";


/// @title TimeToken
///
/// @dev This is the contract for the Alchemix time token.
///

contract TimeToken is AccessControl, ERC20 {

  /// @dev The identifier of the role which maintains other roles.
  bytes32 public constant ADMIN_ROLE = keccak256("ADMIN");

  /// @dev The identifier of the role which allows accounts to mint tokens.
  bytes32 public constant MINTER_ROLE = keccak256("MINTER");

  constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
    _setupRole(ADMIN_ROLE, msg.sender);
    _setupRole(MINTER_ROLE, msg.sender);
    _setRoleAdmin(MINTER_ROLE, ADMIN_ROLE);
    _setRoleAdmin(ADMIN_ROLE, ADMIN_ROLE);
  }

  /// @dev A modifier which checks that the caller has the minter role.
  modifier onlyMinter() {
    require(hasRole(MINTER_ROLE, msg.sender), "TimeToken: only minter");
    _;
  }

  /// @dev Mints tokens to a recipient.
  ///
  /// This function reverts if the caller does not have the minter role.
  ///
  /// @param _recipient the account to mint tokens to.
  /// @param _amount    the amount of tokens to mint.
  function mint(address _recipient, uint256 _amount) external onlyMinter {
    _mint(_recipient, _amount);
  }
}