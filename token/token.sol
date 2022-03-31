// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;
contract Token {

  // values
  uint public totalSupply = 10000 * 10 ** 18;
  string public name = "PLASS COIN";
  string public symbol = "PLC";

  // mappping
  mapping(address => uint) balances;

  // address to address to balances int
  mapping(address => mapping(address => uint)) public allowance;

  // init, user add 100000 token
  constructor(){
    balances[msg.sender] = totalSupply;
  }

  // Chuyen tien binh thuong
  event Transfer(address indexed from, address indexed to, uint amount);

  // Uy quyen chuyen tien
  // Se nhan uy quyen tu 1 nguoi khac de chuyen tien den 1 tai khoan khac
  event Approve(address indexed owner, address indexed spender, uint amount);

  // function
  // get balances by address
  function balancesOf(address owner) public view returns (uint) {
    return balances[owner];
  }

  // chuyen tien binh thuong
  function transfer(address to, uint amount) public returns (bool) {
    require(balancesOf(msg.sender) >= amount, "Balance to low");
    balances[to] += amount;
    balances[msg.sender] -= amount;

    // run event transfer
    emit Transfer(msg.sender, to, amount);
    return true;
  }

  // defi uy quyen
  function transferFrom(address from, address to, uint amount ) public returns (bool) {
    require(balancesOf(from) >= amount, "Balance to low"); // kiem tra vi cua nguoi nhan uy quyen
    require(allowance[from][msg.sender] >= amount, "Balance to low"); // tu nguoi nhan uy quyen se truy cap vao vi cua nguoi uy quyen de kiem tra vi
    balances[to] += amount;
    balances[from] -= amount;
    emit Transfer(from, to, amount);
    return true;
  }
  // function uy quyen
  // nguoi nhan uy quyen se truy cap vao vi cua nguoi uy quyen
  function approve(address spender, uint amount) public returns (bool) {
    allowance[msg.sender][spender] = amount;
    return true;
  }
}

