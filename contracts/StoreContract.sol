// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Ownable.sol";
import "./Roles.sol";

contract StoreContract {
  struct Store {
    string city;
    uint balance;
  }

  mapping (address => Store) public stores;

  function getStore(address account) public view returns (Store memory) {
    return stores[account];
  }

  function addStore(address account, string memory city) public {
    stores[account] = Store({
      city: city,
      balance: 1000
    });
  }
}
