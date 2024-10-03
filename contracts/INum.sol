// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface INumber{
    function getVatValue() external view returns (uint256);

    function addAmount(uint256 _num, address _addr) external returns (bool);

    function getUserBal(address _addr) external view returns (uint256);

}


contract Interaction{
    address numberContractAddress;

    constructor(address _contractAddr){
        numberContractAddress = _contractAddr;
    }

    function getVat() public view returns (uint){
        return INumber(numberContractAddress).getVatValue();
    }

    function fund(uint amount, address _addr) public  {
        INumber(numberContractAddress).addAmount(amount, _addr);
    }

    function checkBal(address _addr) public view returns (uint){
        return INumber(numberContractAddress).getUserBal(_addr);
    }
}