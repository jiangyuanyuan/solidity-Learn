pragma solidity ^0.4.0;

interface Zf{

	function checkValue(uint amount) external returns(bool);
	function loan () external returns (bool);
}

contract Bank is Zf{
	uint private value:

	constructor (uint amount) public{
		value = amount;
	}

	function deposit(uint amount) public {
		value +=amount;
	}

	function withdraw(uint amount) public {
		if(checkValue(amount)){
			value -=amount;
		}
	}

	function balance() public view returns(bool){

		return value >=amount;
	}

	function checkValue(uint amount) public returns(bool){
		return value >= amount;
	}

	function loan() public returns(bool){
		return value>0;
	}

}


contract CCB is Bank(10){
	string private name;
	uint private age;

	function setName(string newName) public{
		name = newName;
	}

	function getName()public view returns(string){
		return name;
	}

	function setAge(uint newAge) public{
		age = newAge;
	}

	function getAge()public view returns(uint){
		return age;
	}

}


contract TestThrows{
	function testAssert() public pure{
		assert(1==2);
	}

	function testRequire() public pure{
		require(2 == 1);
	}

	function testRevert() public pure{
		revert();
	}

	function testThrow() public pure{
		throw;
	}
}