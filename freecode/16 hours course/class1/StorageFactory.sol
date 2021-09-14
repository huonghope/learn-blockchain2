pragma solidity >= 0.7.0;

import './SimpleStorage.sol';


// Them tu is se lam cho 2 smartcontract lien ket voi nhau
// Nhung method tai SimpleStorage co the duoc truy cap duoc
// Recap
// Interface
contract StorageFactory is SimpleStorage{
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    // add simpleStorage
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNUmber) public {
        //Addrress
        
        // ABI
        // co the rut ngan code
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        simpleStorage.store(_simpleStorageNUmber);
        
    }
    
    // return favivoteNumbe by name
    // create by address
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // co the chut ngan code
        SimpleStorage simpleStorage = SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]));
        return simpleStorage.retrieve();
    }
}