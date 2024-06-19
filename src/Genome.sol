// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NFTGenome {
    // Optimized Storage of 5,000 Genomes
    // Solution Strategy:
    // Data Structure: Utilize a struct to represent each genome. This keeps
    // the data organized and makes it simple to decode.

    // Mapping for Storage: Use a mapping(uint256 => bytes) where uint256 represents
    // a genome ID and bytes represents the genome data.
    // Gives the genome data more flexibility while
    // taking advantage of compact bytes.

    // Thoughts
    // Using bytes for storage optimizes space usage
    // as well allows for potential future changes in the struct
    // of the genome data without neededing a complete change of the stored data.

    // Providing a simple interface to store and retrieve genome data,
    // the system is made to have structure for everyone to understand while
    // maintaining gas effiency

    // The way the genome data is stored and accessed securely was a key thought.
    // The struct and bytes approach safeguards the data,
    // ensuring that it remains unaltered and accessible as intended.

    // Gas
    // Using abi.encode and abi.decode methods,
    // will minimize the operations performed during creation and retrevial
    // while reducing the gas required. As these are the most computationally intensive tasks.

    struct Genome {
        uint8 backgroundColor;
        uint8 backgroundEffect;
        uint8 wings;
        uint8 skinPattern;
        uint8 body;
        uint8 mouth;
        uint8 eyes;
        uint8 skinColor;
        uint8 hat;
        uint8 pet;
        uint8 accessory;
        uint8 border;
    }

    // Mapping from token ID to Genome
    mapping(uint256 => bytes) public genomes;

    // Function to store a new genome
    // Could make the params bytes
    function storeGenome(
        uint256 genomeId,
        uint8 backgroundColor,
        uint8 backgroundEffect,
        uint8 wings,
        uint8 skinPattern,
        uint8 body,
        uint8 mouth,
        uint8 eyes,
        uint8 skinColor,
        uint8 hat,
        uint8 pet,
        uint8 accessory,
        uint8 border
    ) public {
        Genome memory newGenome = Genome({
            backgroundColor: backgroundColor,
            backgroundEffect: backgroundEffect,
            wings: wings,
            skinPattern: skinPattern,
            body: body,
            mouth: mouth,
            eyes: eyes,
            skinColor: skinColor,
            hat: hat,
            pet: pet,
            accessory: accessory,
            border: border
        });
        bytes memory data = abi.encode(newGenome);
        genomes[genomeId] = data;
    }

    // Implement a function to decode a genome, and return genome attributes
    function getGenome(uint256 genomeId) public view returns (Genome memory) {
        bytes memory data = abi.encode(genomes[genomeId]);

        return abi.decode(data, (Genome));
    }
}
