// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity >0.6.0;
pragma experimental ABIEncoderV2;

contract Messages {
		address public creator;

		struct Message {
			string handler;
			string message;
			uint256 datetime;
		}

		mapping(address => Message) public messages;

		// Emitted when the stored value changes
    event MessageRecieved(Message newMessageFromSender);

		constructor() public {
			messages[msg.sender] = Message(
				'@kn9ts',
				'Hello world! Initializing the contract',
				block.timestamp
			);
			creator = msg.sender;
		}

		// Receive and store incoming messages from different addresses/people
    function post(Message memory newMessageFromSender) public {
				messages[msg.sender] = newMessageFromSender;
        emit MessageRecieved(messages[msg.sender]);
    }

    // Reads the last stored value
    function get() public view returns (Message memory) {
        return messages[msg.sender];
    }

}
