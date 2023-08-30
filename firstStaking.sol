// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

interface ISTAKE {
        function transferFrom(address from, address to, uint256 amount) external returns (bool);

}

contract GoStake{
      address immutable public tokenCA;
      uint public balanceStake;
      mapping(address => uint) public  _newBalance;
      

      constructor(address _tokenca){
          tokenCA = _tokenca;
      }

      function staking(uint _amount)external {
          ISTAKE tokenStake = ISTAKE(tokenCA);
          tokenStake.transferFrom(msg.sender, address(this), _amount);
          _newBalance[msg.sender] += _amount;
          balanceStake += _amount;
      }


}


