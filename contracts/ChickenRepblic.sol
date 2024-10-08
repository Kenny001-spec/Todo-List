// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BaseStore {
    uint256 public priceOfRice = 1000;
    uint256 public priceOfBottle = 500;
    uint256 public priceOfBurger = 2000;
    uint256 public priceOfShawarma = 3000;

    function getBasePrice() public view virtual returns (uint256, uint256, uint256, uint256) {
        return (priceOfRice, priceOfBottle, priceOfBurger, priceOfShawarma);
    }
}

contract IkoroduStore is BaseStore {

    function getAllPrice() public view virtual returns (uint256, uint256, uint256, uint256) {
        return (
            priceOfRice * 10,
            priceOfBottle * 10,
            priceOfBurger * 10,
            priceOfShawarma * 10
        );
    }
}

contract MainLandStore is BaseStore, IkoroduStore {

    function getAllPrice() public view virtual override returns (uint256, uint256, uint256, uint256) {
        return (
            priceOfRice * 15,
            priceOfBottle * 15,
            priceOfBurger * 15,
            priceOfShawarma * 15
        );
    }

    function IkoroduStorePrice() public view virtual returns (uint256, uint256, uint256, uint256) {
        return super.getAllPrice();
    }
}

contract VictoriaIslandStore is BaseStore, IkoroduStore, MainLandStore {

    function getMainLandStorePrice() public view virtual returns (uint256, uint256, uint256, uint256) {
        return super.getAllPrice();
    }

    function getAllPrice() public view override(IkoroduStore, MainLandStore) returns (uint256, uint256, uint256, uint256) {
        return (
            priceOfRice * 25,
            priceOfBottle * 25,
            priceOfBurger * 25,
            priceOfShawarma * 25
        );
    }
}


    

