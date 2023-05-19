// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

contract Q4_Add {
    // 1. Add 0x07 to 0x08
    // 2. Store the result at the next free memory location
    // 3. Write this again in opcodes
    function add() external pure returns (uint256) {
        // Using Yul
        assembly {
            let mem_ptr := mload(0x40)
            let free_mem_ptr := add(mem_ptr, 0x20)
            let result := add(0x07, 0x08)
            mstore(free_mem_ptr, result)
            return(free_mem_ptr, 0x20)
        }

        // Using opcodes: NAME (OPCODE) VALUE
        // PUSH (60) 0x07
        // PUSH (60) 0x08
        // ADD (01)
        // PUSH (60) 0x80
        // MSTORE (52)
        // = 6007600801608052
    }
}

contract Q6_Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // stack variables are instantiated with
            // let variable_name := VALßUE
            // instantiate a stack variable that holds the value of mol
            // To return it needs to be stored in memory
            // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
            // to return you need to specify address and the size from the starting point
            let mol_stack := mol
            mstore(0x80, mol_stack)
            return(0x80, 0x20)
        }
    }
}

contract Q6_Add {
    function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
        // Intermediate variables can't communicate between assembly blocks
        // But they can be written to memory in one block
        // and retrieved in another.
        // Fix this code using memory to store the result between the blocks
        // and return the result from the second block
        assembly {
            let result := add(x, y)
            mstore(0x80, result)
        }

        assembly {
            return(0x80, 0x20)
        }
    }
}

contract Q6_SubOverflow {
    // Modify this function so that on overflow it returns the value 0
    // otherwise it should return x - y
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        // Write assembly code that handles overflows
        assembly {
            if lt(x, y) {
                mstore(0x80, 0)
                return(0x80, 0x20)
            }
            mstore(0x80, sub(x, y))
            return(0x80, 0x20)
        }
    }
}

contract Q6_Scope {
    uint256 public count = 10;

    function increment(uint256 num) public {
        // Modify state of the count variable from within
        // the assembly segment
        assembly {
            sstore(count.slot, add(num, sload(count.slot)))
        }
    }
}
