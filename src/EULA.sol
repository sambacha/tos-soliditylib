pragma solidity ^0.8.7;

import "./StringUtils.sol";

import "./libd.sol";
// D.str_concat(D.to_ascii_....)
contract EULA {

      function addressToString(address _address)
        internal
        pure
        returns (string memory)
    {
        bytes32 value = bytes32(uint256(uint160(_address)));
        bytes16 alphabet = "0123456789abcdef";

        bytes memory str = new bytes(42);
        str[0] = "0";
        str[1] = "x";
        for (uint256 i; i < 20; i++) {
            str[2 + i * 2] = alphabet[uint8(value[i + 12] >> 4)];
            str[3 + i * 2] = alphabet[uint8(value[i + 12] & 0x0f)];
        }

        return string(str);
    }
	
	function certificateText(
		address licenseContractAddress
    // public pure returns (string memory 
	) external pure returns (string memory) {
		string memory s = D.str_concat(
			 unicode"\n",
		   addressToString(licenseContractAddress),
			unicode"“.\n\nBy downloading or using 'DApp' (“Application“), you\n are agreeing to be bound by the terms and conditions of this Agreement.\n\n This Agreement is a legal agreement between you (either an individual or a\n single entity) and B<THE_COMPANY> "
		);
		s = D.str_concat(
			s,
			unicode"\n",
			unicode"\n\n <THE_COMPANY> provides no warranty or undertaking, and\n makes no representation of any kind that the Application will meet your\n requirements, achieve any intended results, be compatible or work with any\n other software, applications, systems or services, operate without\n interruption, meet any performance or reliability standards or be error free\n or that any errors or defects can or will be corrected.\n\n"
		);
		return s;
	}
    function getSpdx() public pure returns (string memory) {
    return 'SPDX';
  }
}