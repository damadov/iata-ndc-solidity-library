// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessControl {

  address public ownerAddress;
  address public bridgeAddress;

  constructor() {
    ownerAddress = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == ownerAddress);
    _;
  }

  modifier onlyBridge() {
    require(msg.sender == bridgeAddress);
    _;
  }

  function setOwner(address _owner) external onlyOwner {
    require(_owner != address(0));
    ownerAddress = _owner;
  }

  function setBridge(address _bridge) external onlyOwner {
    bridgeAddress = _bridge;
  }

  function withdrawBalance() external onlyOwner {
     payable(ownerAddress).transfer(address(this).balance);
  }
}