// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Ownable.sol";

contract Wholesale is Ownable {
  address private dealer = 0x9ceaDAFC54eD585f30AbdCc25A96f2146dB3686e;

  struct Store {
    string city;
    uint balance;
  }


}
