// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract SimpleStorage{
    // variable
    uint32 public vaultNumber;

    // Method
    function setNum(uint32 _num) public returns(bool){
        vaultNumber = _num;
        return true;
    }

    function getNum() public view returns(uint32 num_, uint32 vatN_){
        num_ = vaultNumber;
        uint32 vat = 2;
        (uint32 mul_, ,uint32 div_) = calculateReward(vaultNumber, vat);  // Helper Method
        vatN_ = mul_ + div_;
    }

    function calculateReward(uint32 _vaultNum, uint32 _vat) private pure returns (uint32 mul_, uint32 add_, uint32 div_){
        mul_ = _vaultNum * _vat;
        add_ = _vaultNum + _vat;
        div_ = _vaultNum / _vat;

    }
   
}