# <b>Week 3</b>


## <b>Lesson 1</b>
><b>Continuation of W2L4's homework about gas optimization ([Foundry Project](https://github.com/flamuri-dev/expert-solidity-bootcamp/tree/main/week2/W2L4))</b>

## <b>Lesson 2</b>
><b>Q1:</b> Why are negative numbers more expensive to store than positive numbers ?
<br><b>A:</b> It costs more to set a bit from 0 to 1 than the opposite. Considering the fact that negative numbers are representated by 0xfff...fff, they cost more to store.

><b>Q2:</b> Test the following statements in Remix, which is cheaper and why? Assume that the denominator can never be zero.
```js
    // 1.
    result = numerator / denominator;

    // 2.
    assembly {
        result := div(numerator, denominator)
    }
```
><b>A:</b> 2. is cheaper in terms of gas cost because in the scenario 1. the compiler adds an aditional zero check for the denominator.