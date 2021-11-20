// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Roles.sol";

contract AdminContract is Roles {
  function promoteCustomerToSeller(address customerAccount) external onlyRole(RolesEnum.Admin) {
    require(!accountRoles[customerAccount][RolesEnum.Admin], 'The user has already have admin rights.');
    accountRoles[customerAccount][RolesEnum.Admin] = true;
  }
}
