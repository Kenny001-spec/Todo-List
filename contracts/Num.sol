// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Number {
    uint32 public  VAT = 100;

    constructor(){}

    mapping (address => uint256) acct;
    mapping (address => uint256) vatpayment;

    function getVatValue() public view returns (uint256){
        return  VAT;
    }

    function addAmount(uint256 _num, address _addr) public  returns (bool){
        require(_num > VAT, "Not enough");

        uint res = _num - VAT;

        vatpayment [_addr] += VAT;

        acct [_addr] += res;

        return true;

    }

    function getUserBal(address _addr) public  view returns (uint256){
        return acct[_addr];
    }
}