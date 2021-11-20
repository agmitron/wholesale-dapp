// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract BaseAccountRoles {
    mapping(address => mapping(uint256 => bool)) accountRoles;

    function addAccountRole(address account, uint256 role) internal {
        accountRoles[account][role] = true;
    }

    function hasAccountRole(address account, uint256 role)
        internal
        view
        returns (bool)
    {
        return accountRoles[account][role];
    }
}
