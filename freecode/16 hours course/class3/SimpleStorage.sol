// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0;

contract SimpleStorage {
    uint256 public favoriteNumber;


    struct People{
        uint256 favoriteNumber;
        string name;
    }  
    
    People[] public peoples;
    mapping(string => uint256) public nameToFarivoteNumber;
    
    //store favoriteNumber
    function store(uint256 _favoriteNumber) public{
        favoriteNumber = _favoriteNumber;
        //return favoriteNumber;
    }
    // return my favoriteNumber
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    // addPerson mapping name => favoriteNumber
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        peoples.push(People(_favoriteNumber, _name));
        nameToFarivoteNumber[_name] = _favoriteNumber;
    }
}