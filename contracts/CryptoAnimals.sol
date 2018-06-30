pragma solidity 0.4.19;

import "./AccessControl.sol";
import "./ERC721.sol";
import "./SafeMath.sol";

contract DetailedERC721 is ERC721 {
    function name() public view returns (string _name);
    function symbol() public view returns (string _symbol);
}

contract CryptoAnimals is AccessControl, DetailedERC721 {
    using SafeMath for unit256;

    event tokenCreated(
        uint256 tokenId,
        string name,
        bytes5 dna,
        uint256 price,
        address owner
    );
    event TokenSold(
        uint256 indexed tokenId,
        string name,
        bytes5 dna,
        uint256 sellingPrice,
        uint256 newPrice,
        address indexed oldOwner,
        address indexed newOwner
    );

    mapping (uint256 => address) private tokenIdToOwner;
    mapping (uint256 => uint256) private tokenIdToPrice;
    mapping (address => uint256) private ownershipTokenCount;
    mapping (uint256 => address) private tokenIdToApproved;

    struct Animal {
        string name;
        bytes5 dna;
    }

    Animal[] private animals;

    uint256 private startingPrice = 0.01 ether;
    bool private erc721Enabled = false;

    modifier onlyERC721() {
        require(erc721Enabled);
        _;
    }
}