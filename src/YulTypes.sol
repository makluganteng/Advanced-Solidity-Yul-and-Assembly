// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract YulTypes {
    function getNumber() external pure returns (uint256){
        uint256 x; 

        assembly {
            x := 42
        }

        return x;
    }

    function getHex() external pure returns (uint256){
        uint256 x; 

        assembly {
            x := 0xa
        }

        return x;
    }

    function demoString() external pure returns (string memory){
        // this is the wrong way to do string memory myString = "";
        //the reason is because string is stored in memory heap and yul is checking the stack where it has a pointer pointing to stack
        //correct way should be 
        bytes32 myString = "";

        assembly {
            myString := "hello world"
        }

        return string(abi.encode(myString));
    }

    function representation() external pure returns(uint16){
        uint16 x;

        assembly {
            x := 1
        }

        return x;
    }
}