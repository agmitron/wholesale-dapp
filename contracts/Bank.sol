// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Ownable.sol";

interface IBank {
  function lendEth(uint256 amount, address payable lender) external;
  function getBalance() external view returns (uint256);
}


contract Bank is Ownable, IBank {
    address private account = 0xAdabc19112Bd5C5e7FBB07bD60aa3c97b70708B9;

    function setBank(address newBank) external onlyOwner {
        account = newBank;
    }

    function lendEth(uint256 amount, address payable lender)
        external
        onlyOwner
    {
        (bool sent, ) = lender.call{value: amount}("");
        require(sent, "Failed to lend Ether");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}
}

