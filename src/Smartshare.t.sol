pragma solidity ^0.4.16;

import "ds-test/test.sol";

import "./Smartshare.sol";

contract SmartshareTest is DSTest {
    Smartshare smartshare;

    function setUp() {
        smartshare = new Smartshare();
    }

    function testFail_basic_sanity() {
        assertTrue(false);
    }

    function test_basic_sanity() {
        assertTrue(true);
    }
}
