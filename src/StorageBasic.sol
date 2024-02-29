// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// sload(slot)
// sstore(slot, value)
// (variable name).slot

contract StorageBasics {
    //slot 0
    uint256 x = 2;
    //slot 1
    uint256 y = 3;
    //slot 2
    uint256 z = 4;
    //slot 3
    uint256 p;

    function getVarYul(uint256 slot) external view returns (uint256 ret){
        assembly {
            ret := sload(slot)
        }
    }

    function setVarYul(uint256 newVal) external {
        assembly {
            sstore(y.slot, newVal)
        }
    }

    function getXYul() external view returns (uint256 ret){
        assembly {
            ret := sload(x.slot)
        }
    }

    function setX(uint256 newVal) external {
        x = newVal;
    }
}