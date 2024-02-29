// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract IfComparison {
    function isTruthy() external pure returns (uint256 result){
        result = 2;
        assembly {
            if 2 {
                result := 1
            }
        }

        return result; // returns 1
    }

    function isFalsy() external pure returns (uint256 result) {
        result = 1;
        assembly {
            if 0 {
                result := 2
            }
        }

        return result; // returns 1
    }

    function negation() external pure returns (uint256 result){
        result = 1;
        assembly {
            if iszero(0){
                result := 2
            }
        }
    }

    function unsafe1NegationPart1() external pure returns (uint256 result){
        result = 1;
        assembly {
            if not(0){
                result := 2
            }
        }

        return result; //returns 2
    }

    function bitflip() external pure returns (bytes32 result){
        assembly {
            result := not(2)
        }

        return result;
    }

    function safeNegation() external pure returns (uint256 result){
        result = 1;
        assembly {
            if iszero(2){
                result := 2
            }
        }

        return result; //returns 1
    }

    function max(uint256 x, uint256 y) external pure returns (uint256 maximum){
        assembly {
            //lt = less than
            if lt(x,y){
                maximum := y
            }
            if iszero(lt(x,y)){
                maximum := x
            }
        }
    }
}
