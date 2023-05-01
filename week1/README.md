# <b>Week 1</b>

## <b>Lesson 1</b>
><b>Q:</b> Why is client diversity important for Ethereum?
<br><b>A:</b> Client diversity is crucial for a decentralized network's health. A bug in one client poses less risk when there are many independently developed clients. A diverse range of clients makes the network more resilient to attacks and more robust. It also prevents a consensus client from gaining too much control, which could result in critical bugs causing problems for the network. Shared responsibility across multiple teams is beneficial for the network's development and maintenance.

><b>Q:</b> Where is the full Ethereum state held?
<br><b>A:</b> The world state is a mapping between addresses (160-bit identifiers) and account states stored in an instance of an Ethereum client configured to build an archive of all historical states, frequently referred as an archive node.

><b>Q:</b> What is a replay attack? Which 2 pieces of information can prevent it?
<br><b>A:</b> A replay attack happens when a malicious figure sneaks up on a secure network connection, intercepts it, and then manages to delay or resend a valid data transmission in order to subvert the receiver. Both nonce (that produces a unique transaction hash) and the chain ID prevent replay attacks from happening on Ethereum.

><b>Q:</b> In a contract, how do we know who called a view function?
<br><b>A:</b> We don't. Solidity functions with the view modifier are read-only, they do not modify the blockchain. So external calls to these functions will not form part of an Ethereum transaction, and will therefore not be put on the mempool. That way, it's strictly impossible to know who called a specific view function.

## <b>Lesson 2</b>
><b>Q:</b> Write a function that will delete items (one at a time) from a dynamic array without
leaving gaps in the array. You should assume that the items to be deleted are chosen at
random, and try to do this in a gas efficient manner.
For example imagine your array has 12 items and you need to delete the items at indexes
8, 2 and 7.
The final array will then have items {0, 1, 3, 4, 5, 6, 9, 10, 11}
<br><b>A:</b> [Foundry Project](https://github.com/flamuri-dev/expert-solidity-bootcamp/blob/main/week1/W1L2)

## <b>Lesson 3</b>
><b>Q:</b> What are the advantages and disadvantages of the 256 bit word length in the EVM?
<br><b>A:</b> Advantages: It facilitates Keccak256 hash scheme and elliptic-curve computations and it also increases the precision in arithmetics.
Disavantages: It requires more store space and memory to store that data and it also slows the execution of instructions (which affects directly the performance of the Ethereum network).

><b>Q:</b> What would happen if the implementation of a precompiled contract varied between Ethereum clients?
<br><b>A:</b> It could potentially lead to inconsistencies such as different clients producing different results for the same execution. That's why it's very important to closely follow the Ethereum protocol specification and maintain consistent implementations of precompiled contracts.

<!---
## <b>Lesson 4</b>
><b>Q:</b>
<br><b>A:</b> 

><b>Q:</b>
<br><b>A:</b> 

><b>Q:</b>
<br><b>A:</b> 
-->