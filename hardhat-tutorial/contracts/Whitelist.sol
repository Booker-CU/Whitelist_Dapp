//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    //max num of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // address is set to false by default, if address is whitelisted set to true
    mapping(address => bool) public whitelistedAddresses;

    // tracks num of white listed addresses
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */
     function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Limited reached, no more addresses can be added");

        whitelistedAddresses[msg.sender] = true;
        //increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;

     }



}