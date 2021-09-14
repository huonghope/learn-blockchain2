// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract Minigame {
  
  Hocvien[] public arrHocVien;
  struct Hocvien{
    string _Id;
    address _addressVi;
  }

  event alertNodoServer(address _add, string _id);

  function Dangky(string memory _id) public {
    arrHocVien.push(Hocvien(_id, msg.sender));
    emit alertNodoServer(msg.sender, _id);
  }
}