//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import "lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import "lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

contract BoxV1 is Initializable, OwnableUpgradeable, UUPSUpgradeable{
    uint256 internal number;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }
    
    function initialize() public initializer {
        // __Ownable_init();  
        __UUPSUpgradeable_init();
    }

    function setNumber(uint256 _number) external {
        number = _number;
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner{}
}