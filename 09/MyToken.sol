pragma solidity ^0.4.0;

import "browser/ERC20.sol";

contract MyToken is ERC20{

	string public constant symbol = "MFT";
	string public constant name = "My First Token";
	uint8 public constant decimals = 18;

	uint private constant _totalSupply = 1000;
	mapping(address => uint) private _balanceOf;
	mapping(address => mapping(address => uint)) private _allowances;

	constructor() public{
		_balanceOf[msg.sender] = _totalSupply;
	}

	function tatalSupply() public constant returns(uint){
		return _totalSupply;
	}

	function balanceOf(address _addr) public constant returns (uint balance){
		return _balanceOf[_addr];
	}

	function transfer(address _to,uint _value) public constant returns (bool success){
		if(_value >0&&_value<=balanceOf(msg.sender)){
			_balanceOf[msg.sender] -= _value;
			_balanceOf[_to] +=_value;
			return true;
		}
		return false;
	}


	function transferFrom(address _from,address _to,uint _value)public returns (bool success){
		if(_allowances[_from][msg.sender]>0&&
			_value>0&&
			_allowances[_from][msg.sender]>=_value&&
			_allowances[_from]>=_value){

			_balanceOf[_from] -=_value;
			_balanceOf[_to] +=_value;
			_allowances[_from][msg.sender] -=_value;
			return true;
		}
		return false;
	}

	function approve(address _spender,uint _value) public returns (bool success){
		_allowances[msg.sender][_spender] = _value;
	}

	function allowance(address _owner,address _spender) public constant returns(uint remaining){
		return _allowances[_owner][_spender];
	}

}