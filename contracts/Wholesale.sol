// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Ownable.sol";

contract Wholesale is Ownable {
  address private dealer = 0x9ceaDAFC54eD585f30AbdCc25A96f2146dB3686e;

  struct Store {
    string city;
    uint balance;
  }

  mapping (address => address) public storesToSellersMap;
  mapping (address => Store) public storesMap;
  mapping (address => bool) public adminsMap;
  mapping (address => bool) public sellersMap;
  mapping (address => bool) public buyersMap;
  mapping (address => bool) public guestsMap;

  constructor() {
    adminsMap[msg.sender] = true;
  }

  /// Only admins can call this method
  error OnlyForAdmins();

  modifier onlyAdmin() {
    require(adminsMap[msg.sender], 'This method is allowed only for admins.');
    _;
  }

  modifier guestGuard() {

  }

  function addStore(address account, string memory city) external onlyAdmin {
    Store memory newStore = Store(city, 1000);
    storesMap[account] = newStore;
  }

  function addAdmin(address account) external onlyAdmin {
    adminsMap[account] = true;
  }

  function removeStore(address storeToRemove) external onlyAdmin {
    delete storesMap[storeToRemove];
  }

  function promoteToSeller(address accountToPromote) external onlyAdmin {

  }
}
