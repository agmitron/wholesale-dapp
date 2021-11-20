// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Ownable.sol";

contract Roles is Ownable {
    enum RolesEnum {
      Admin,
      Seller,
      Customer,
      Guest,
      Store
    }

    mapping(address => mapping(RolesEnum => bool)) accountRoles;

    function addAccountRole(address account, RolesEnum role) internal onlyOwner {
        accountRoles[account][role] = true;
    }

    function hasAccountRole(address account, RolesEnum role)
        internal
        view
        returns (bool)
    {
        return accountRoles[account][role];
    }

    modifier onlyRole(RolesEnum role) {
      require(hasAccountRole(msg.sender, role), "You don't have enough permissions to call this method.");
      _;
    }
}
