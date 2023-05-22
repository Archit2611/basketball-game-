// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasketballGame {
    address public player1;
    address public player2;
    uint public player1Score;
    uint public player2Score;
    bool public gameEnded;

    event ShotScored(address player, uint score);

    constructor(address _player2) {
        player1 = msg. sender;
        player2 = _player2;
    }

    function scoreShot() public {
        require(!game ended, "The game has already ended.");
        require(msg.sender == player1 || msg.sender == player2, "You are not a player in this game.");

        uint score = _calculateScore();

        if (msg.sender == player1) {
            player1Score += score;
        } else {
            player2Score += score;
        }

        emit ShotScored(msg.sender, score);
    }

    function _calculateScore() private view returns (uint) {
        // Simulate scoring calculation based on randomness
        uint randomised = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty)));
        uint score = randomised % 3; // Range: 0-2

        return score;
    }

    function endGame() public {
        require(!gameEnded, "The game has already ended.");
        require(msg.sender == player1 || msg.sender == player2, "You are not a player in this game.");

        gameEnded = true;
    }
}
