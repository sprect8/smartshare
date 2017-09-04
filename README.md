# smartshare
A 0.4.x smart share solidity contract to split ether across multiple users.

The purpose of Smart Share is to automate the distribution of funds from a shared mining account into the accounts of multiple people

A team of guys have purchased a mining rig to mine ethereum. The total mined assets are pushed into a shared account.
The mined assets are then split each month on maturity of the mining contract for the month. Each person gets a share of the mined assets depending on their share of the mining rig

SmartShare implements the following security measures:
1. only the owner of the contract can add new members to the mining pool
2. it is the responsibility of the members to withdraw their funds
3. member percentage is set by owner of the contract on calling, and their share is calculated accordingly

Note that as per solidity documentation the best practice recommendation is for the members to withdraw the ether, not the contract owner. This prevents a certain attack vector that can cause funds to be leaked from the contract.
