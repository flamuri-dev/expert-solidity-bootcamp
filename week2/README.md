# <b>Week 2</b>

## <b>Lesson 1</b>
><b>Q1:</b> Look at the example of init code in today's notes. When we do the CODECOPY operation, what are we overwriting?
<br><b>A:</b> We are copying the runtime bytecode to memory (at position 0).

><b>Q2:</b> Could the answer to Q1 allow an optimisation?
<br><b>A:</b> We could potentially remove the free memory pointer initialization code since it's not used.

><b>Q3:</b> Can you trigger a revert in the init code?
<br><b>A:</b> Sending any value (>0) in wei when deploying a new contract with a non-payable constructor will cause a revert.

><b>Q4:</b> Write some Yul to:
<br>1. Add 0x07 to 0x08
<br>2. Store the result at the next free memory location
<br>3. Write this again in opcodes
<br><b>A:</b> [Foundry Project](https://github.com/flamuri-dev/expert-solidity-bootcamp/tree/main/week2/W2L1)

><b>Q5:</b> Can you think of a situation where the opcode EXTCODECOPY is used?
<br><b>A:</b> The EXTCODECOPY opcode can be used in the implementation of a proxy contract.

><b>Q6:</b> Complete the assembly exercises in this [repo](https://github.com/ExtropyIO/ExpertSolidityBootcamp/tree/main/exercises/assembly)
<br><b>A:</b> [Foundry Project](https://github.com/flamuri-dev/expert-solidity-bootcamp/tree/main/week2/W2L1)

## <b>Lesson 2</b>
><b>Q1:</b> Create a Solidity contract with one function. The solidity function should return the amount of ETH that was passed to it, and the function body should be written in assembly
<br><b>A:</b> [Foundry Project](https://github.com/flamuri-dev/expert-solidity-bootcamp/tree/main/week2/W2L2)

><b>Q2:</b> Do you know what this [code](https://gist.githubusercontent.com/extropyCoder/9ddce05801ea7ec0f357ba2d9451b2fb/raw/0245384d93a4d9003bf7728fa511f992b867a728/example) is doing? 
<br><b>A:</b> Deploys 2 contracts and then self destructs.

><b>Q3:</b> Explain what the following code is doing in the Yul ERC20 contract
```js
function allowanceStorageOffset(account, spender) -> offset {
    offset := accountToStorageOffset(account)
    mstore(0, offset)
    mstore(0x20, spender)
    offset := keccak256(0, 0x40)
}
```
><b>A:</b> Calculates the storage location (offset) of the allowance between a specific address and a specific spender.

## <b>Lesson 3</b>
><b>Q1:</b> The parameter ```X``` represents a function.
Complete the function signature so that X is a standard ERC20 transfer function (other than
the visibility). The query function should revert if the ERC20 function returns false
```js
function query(uint _amount, address _receiver, X) public {
    ...
}
```
><b>A:</b> 
```js
function query(uint _amount, address _receiver, function (address, uint256) external returns (bool) transfer) public  {
        (bool result) = transfer(_receiver, _amount);
        if(!result) revert();
}
```
><b>Q2:</b> The following function checks function details passed in the data parameter.
<br>```function checkCall(bytes calldata data) external {}```
<br>The data parameter is bytes encoded representing the following
<br>Function selector
<br>Target address
<br>Amount (uint256)
<br><br>Complete the function body as follows: The function should revert if the function is not an ERC20 transfer function. Otherwise extract the address and amount from the data variable and emit an event with those details: ```event transferOccurred(address,uint256);```
<br><br><b>A:</b>
```js
contract W2_L3_Q2 {
    event transferOccurred(address target, uint256 value);
    
    function checkCall(bytes calldata data) external {
        (bytes4 functionSelector, address _t, uint256 _v) = abi.decode(data, (bytes4, address, uint256));
        bytes4 transferMethodId = 0xa9059cbb;
        assembly {
            if iszero(eq(functionSelector, transferMethodId)) { revert(0, 0) }
        }
        emit transferOccurred(_t, _v);
    }
}
```

## <b>Lesson 4</b>

><b>Q1:</b> Clone this [repo](https://github.com/ExtropyIO/GasOptimisationFoundry). Your task is to edit and optimise the Gas.sol contract. You cannot edit the tests. All the tests must pass. You can change the functionality of the contract as long as the tests pass. Try to get the gas usage as low as possible.
<br><b>A:</b> [Foundry Project](https://github.com/flamuri-dev/expert-solidity-bootcamp/tree/main/week2/W2L4)