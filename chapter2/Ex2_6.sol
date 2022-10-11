// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract quiz1 {
    function sendEther(address _address) public payable {
        (bool success,) = _address.call{value:msg.value}("");
        require(success, "Failed");
    }
}

contract quize2 {

    receive() external payable {

    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendEther() public payable {
        payable(address(this)).transfer(msg.value);
    }
}

contract Math {
    function mul(uint _num1, uint _num2) public pure returns(uint) {
        return _num1 * _num2;
    }
}
contract quiz3 {
    function callMath(address _address, uint _num1, uint _num2) public returns(bytes memory) {

        (bool success, bytes memory output) = _address.call(
            abi.encodeWithSignature("mul(uint256,uint256)", _num1, _num2)
        );

        require(success, "Failed");
        return output;
    }
}

contract Math2{
    uint public total;
    function mul(uint _num1, uint _num2) public {
        total = _num1 * _num2;
    }
}

contract quiz4 {
    uint public total;
    function callMath(address _address, uint _num1, uint _num2) public {
        (bool success,) = _address.delegatecall(
            abi.encodeWithSignature("mul(uint256,uint256)", _num1, _num2)
            );
        require(success, "Failed");
    }
}