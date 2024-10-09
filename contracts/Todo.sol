// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract TodoList{

    address public owner;

    enum Status {None, Created, Edited, Done}

    struct Todo{
        string title;
        string description;
        Status status;
    }

    Todo[] public todos;

    constructor(){
        owner = msg.sender;    // The owner to be the person to deploy the contract
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "You're not allowed");
        _;
    }

    modifier validAddress(){
        require(msg.sender != address(0), "Zeor address not allowed");
        _;
    }

    function createTodo(string memory _title, string memory _desc) external onlyOwner returns (bool){

    }
}