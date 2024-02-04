// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract MintBasicNft is Script {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    uint256 deployerKey;

    function run() external {
        address mostRecentlyDeployedBasicNft = (0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6); //DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployedBasicNft);
    }

    function mintNftOnContract(address basicNftAddress) public {
        vm.startBroadcast();
        BasicNft(basicNftAddress).mintNft(PUG_URI);
        vm.stopBroadcast();
    }
}

// These two scripts are in the git, at lesson 16 supposed to be done by onesself
contract MintMoodNft is Script {
    function run() external {
        address mostRecentlyDeployedBasicNft = (0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6); //DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployedBasicNft);
    }

    function mintNftOnContract(address moodNftAddress) public {
        vm.startBroadcast();
        MoodNft(moodNftAddress).mintNft();
        vm.stopBroadcast();
    }
}

contract FlipMoodNft is Script {
    // There should be a token made before the flip is done, I am questioning maybe the user can identify which token to flip but for now lets keep at 0, also devopstools is still not working properly
    uint256 public constant TOKEN_ID_TO_FLIP = 0;

    function run() external {
        address mostRecentlyDeployedBasicNft = (0x8E743Fc8AF979596C6fecc8e2E91927c5e2E49Dd); //DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        flipMoodNft(mostRecentlyDeployedBasicNft);
    }

    function flipMoodNft(address moodNftAddress) public {
        vm.startBroadcast();
        MoodNft(moodNftAddress).flipMood(TOKEN_ID_TO_FLIP);
        vm.stopBroadcast();
    }
}
