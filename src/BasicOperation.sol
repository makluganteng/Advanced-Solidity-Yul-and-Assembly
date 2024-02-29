// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract IsPrime {
    function isPrime(uint256 x) public pure returns (bool p){
        p = true;
        assembly {
            //Yul works in function so it doesnt understand the pattern of the operation like div is higher than add
            let halfX := add(div(x,2),1)
            let i := 2
            for { } lt(i, halfX){ }
            {
                if iszero(mod(x, i)){
                    p := 0
                    break
                }

                i := add(i, 1)
            }
        }
    }
}
