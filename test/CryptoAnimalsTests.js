var CryptoAnimals = artifacts.require('CryptoAnimals.sol');

contract('CryptoAnimals', function(accounts) {
    var helpfulFunctions = require('./utils/CryptoAnimalsUtils')(CryptoAnimals, accounts);
    var hfn = Object.keys(helpfulFunctions);
    for( var i = 0; i < hfn.length; i++) {
        global[hfn[i]] = helpfulFunctions[hfn[i]];
    }

    for (x = 0; x < 100; x++) {
        checkAnimalCreation(x, 'Animal-' + x, '0x0f0f0f0f0f');
    }
});