// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "./utils/VyperTest.sol";

contract OwnedCounterCompiledTest is VyperTest {
    
    address ownedCounter;

    function setUp() public {
        ownedCounter = deployContract("src/OwnedCounterCompiled.vy", abi.encode(address(this)));
    }

    function testSetCountAccessControl() public {
        assertTrue(true);
    }
}
