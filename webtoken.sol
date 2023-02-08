
// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract W3BVIII is ERC20{
    // constructor() ERC20("W3Bridge", "W3B"){
        //.call
        //.send
        //.transfer

        uint tokenPrice = 2 ether;
        address owner;

    constructor(uint256 amount) ERC20("name","symbol" ){
        // uint256 decimal = decimals;
        _mint(address(this), amount * (10**decimals()));
        owner = msg.sender;
    }


    function buyToken(uint amount) public payable returns(uint balancebefore, uint balanceAfter){
        require(msg.value >= amount *  tokenPrice, "insufficient funds");
        balancebefore = address(this).balance;

        payable(owner).transfer(msg.value);

        _transfer(address(this), msg.sender, amount * (10**decimals()));
        balanceAfter = address(this).balance;

    }

    function withdraw() external {
        require(owner == msg.sender);
       (bool success,) = payable(owner).call{value: (address(this).balance)}("");
       require(success, "transfer failed");

    }
    receive() external payable{}

    fallback() external payable{}

}
///using openzeppeline standard create an erc20 token
//mint to the contract address
//let user buy tokens with ether;
