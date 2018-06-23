pragma solidity 0.4.19;


contract CryptoAnimals {

    uint age = 10;
    uint maxAge = age * 5;
    uint minAge = age - 5;
    uint ultraAge = age ** 2;
    uint modAge = age % 2;

    string name = "Doug";
    string name2 = "Karl";

    struct Animal {
        uint age;
        string name;
        bytes5 dna;
    }

    // How to create an array of animals
    Animal[] animals;

    mapping (uint256 => address) private animalIdToOwner;
    mapping (address => uint256) private numOfAnimals;

    event AnimalCreated(uint256 _id, string _name, uint _age, bytes5 _dna);

    // Instantiate individual animals
    Animal animal1 = Animal({
        age: age,
        name: name,
        dna: bytes5(0x000000000)
    });

    Animal animal2 = Animal({
        age: maxAge,
        name: name2,
        dna: bytes5(0xffffffffff)
    });

    function createAnimal(uint _age, string _name, bytes5 _dna) public {
        Animal memory _animal = Animal({
            age: _age,
            name: _name,
            dna: _dna
        });
        uint256 newAnimalId = animals.push(_animal) - 1;
        animalIdToOwner[newAnimalId] = msg.sender;
        numOfAnimals[msg.sender] = numOfAnimals[msg.sender] + 1;

        AnimalCreated(newAnimalId, _name, _age, _dna);
    }
}