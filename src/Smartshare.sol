pragma solidity ^0.4.15;

// 0xc2199c947a6e9d28285d78327c3e89808eabed75
contract Smartshare {
    address public owner; // owner of the smart contract, and the person who can do stuff with the contract

    mapping(address=>uint256) public receivers;

    /**
     * This is a structure for our investor
     * The amount invested and the owner of the investment (by address)
     */
    struct Investor {
        uint128 invested;
        address owner;
    }

    /**
     * This is a list of registered investors
     * Investor registration can only be done by the owner of the contract
     */
    Investor[] public investors;
    uint256 private pendingFunds; // funds that were transferred to this account for some reason 

    /**
     * Investor registration happens here. Validate the percentages before doing further
     */
    function registerInvestor(address investor, uint128 percentage) {
        uint128 total = 0;
        for (uint i = 0; i < investors.length; ++i) {
            total += investors[i].invested;
        }

        require(total < 1 && total + percentage <= 1);

        investors.push(Investor({owner:investor, invested:percentage}));
        receivers[investor] = 0;
    }

    function divestFunds() payable {
        require(msg.sender == owner);
        for (uint i = 0; i < investors.length; ++i) {
            uint256 paid = investors[i].invested * msg.value + receivers[investors[i].owner];

            receivers[investors[i].owner] = paid;
        }
        pendingFunds = 0;
    }

    function withdrawFunds() {
        bool found = false;
        uint index = 0;
        for (uint i = 0; i < investors.length; ++i) {
            if (investors[i].owner == msg.sender) {
                found = true;
                index = i;
                break;
            }
        }

        require(found);
        require(receivers[msg.sender] > 0);

        uint256 total = receivers[msg.sender];
        receivers[msg.sender] = 0;
        msg.sender.transfer(total);
    }

    function () payable {
        pendingFunds += msg.value;
    }

    /**
     * Unregistering an investor will divest their share among the existing investors
     * in the list. Divestment percentage is based on the share percentage among existing investors
     */
    function unregisterInvestor(address investor) {

    }

    /**
     * Closing a contract will send all funds back to the owner and then close the contract
     */
    function closeContract() {
        selfdestruct(owner);
    }
}
