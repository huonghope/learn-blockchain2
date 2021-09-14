// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0;

import "@chainlink/contracts/src/v0.7/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.7/vendor/SafeMathChainlink.sol";

// wei is smallest value
contract FundMe {
    
    using SafeMathChainlink for uint256;
    
    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;
    address public owner;
    
    // init dia chi cua nguoi hien tai
    constructor() public{
        owner = msg.sender;
    }    
    
    
    // Cong them tien vao cho vi dia chi kia
    // Key chinh la dia chi cua vi
    // Su dung chainlink de nhan du va trao doi du lieu tu ben ngoai
    function fund() public payable{
        uint256 mimimumUSD = 50 * 10 * 18;    
        //if(msg.value < mimimumUSD) revert("mimimumUSD");
            
        require(getConversionRate(msg.value) >= mimimumUSD, "You dont have money, send more plesaes");
        
        // 1gwei < 50$
        
        addressToAmountFunded[msg.sender] += msg.value;
        // what the ETH -> USD conversion rate
        
        
        // Luu lai nhung nguoi da gui
        funders.push(msg.sender);
    }
    
    // xuat version cua AggregatorV3Interface
    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xcf0f51ca2cDAecb464eeE4227f5295F2384F84ED);
        return priceFeed.version();
    } 
    
    // return current price Eth => USD
    function getPrice() public view returns(uint256){
         AggregatorV3Interface priceFeed = AggregatorV3Interface(0xcf0f51ca2cDAecb464eeE4227f5295F2384F84ED);
         (  uint80 roundId,
          int256 answer,
          uint256 startedAt,
          uint256 updatedAt,
          uint80 answeredInRound
          ) = priceFeed.latestRoundData();
          //4,083.2682427
         return uint256(answer * 100000000);
    }
    
    // convert eth => usd :D
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 100000000000000000;
        return ethAmountInUsd;
    }
    
    modifier onlyOwner(){
          require (msg.sender == owner, "Dont can transfer");
          _;
    }
    
    // Vi Balance
    // Gui den dia chi cua chinh ban than no vi hien tai
    // require, chi dia chi nguoi nguoi hien tai moi duoc chuyen
    // Tuc la nguoi run va thi hanh smarttracts
    function withdraw() payable onlyOwner public{
        // only want the contract admin/owner
        msg.sender.transfer(address(this).balance);
        
        
        // Su dung vong lap For de gui cho tat ca cac smarttracts tim duoc 
        for(uint256 funderIndex = 0; funderIndex <= funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0; //default address funder = 0
        }
        
        //Khoi tao gia tri cho mang tat ca deu bang 0
        funders = new address[](0);
    }
    
    
}