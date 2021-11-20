// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Roles.sol";

contract AdminContract is Roles {
    function promoteCustomerToSeller(address customerAccount)
        external
        onlyRole(RolesEnum.Admin)
    {
        require(
            !accountRoles[customerAccount][RolesEnum.Customer],
            "The user must be a customer."
        );
        require(
            !accountRoles[customerAccount][RolesEnum.Seller],
            "The user has already have admin rights."
        );
        accountRoles[customerAccount][RolesEnum.Seller] = true;
    }

    function demoteSellerToCustomer(address customerAccount)
        external
        onlyRole(RolesEnum.Admin)
    {
        require(
            accountRoles[customerAccount][RolesEnum.Seller],
            "The user doesn't have seller rights."
        );
        accountRoles[customerAccount][RolesEnum.Seller] = false;
        accountRoles[customerAccount][RolesEnum.Customer] = true;
    }
}
