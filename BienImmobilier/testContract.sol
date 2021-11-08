pragma solidity ^0.8.7;

import './Owner.sol';

contract TestContract is Owner{
    
    enum typeBien {terrain, appartement, maison}
    
    struct bien {
        uint        id;
        string      name;
        uint        price;
        typeBien    _typeBien;
    }
    
    uint compteur;
    
    mapping(address => bien[]) Possessions;
    
    function addBien(address _proprietaire, string memory _name, uint _price, typeBien _typeBien) public isOwner {
        require(_price > 1000, "The price must cost more than 1000 wei");
        require(uint(_typeBien) >= 0, "The propertie must be between 0 and 2");
        require(uint(_typeBien) <= 2, "The propertie must be between 0 and 2");
        Possessions[_proprietaire].push(bien(compteur, _name, _price, _typeBien));
        compteur++;
    }
    
    function getBiens(address _proprietaire) public view isOwner returns(bien[] memory) {
        return Possessions[_proprietaire];
    }
    
    function getNombreBiens(address _proprietaire) public view isOwner returns(uint) {
        return Possessions[_proprietaire].length;
    }
    
    function getMesBiens() public view returns(bien[] memory) {
        return Possessions[msg.sender];
    }
}
