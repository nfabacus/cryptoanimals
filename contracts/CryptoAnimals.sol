pragma solidity 0.4.20;


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
    Animal[] doggies;

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
}