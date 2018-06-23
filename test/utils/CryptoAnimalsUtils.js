module.exports = function (CryptoAnimals, accounts) {
    function checkAnimalCreation (age, name, dna) {
        it('createAnimal should create an animal named' + name, function (done) {
            CryptoAnimals.deployed().then(async function (instance) {
                await instance.createAnimal(age, name, dna, {
                    from: accounts[0]
                }).then(function (result) {
                    assert.include(result.logs[0].event, 'AnimalCreated', 'AnimalCreated event was not triggered');
                })
            }).then(done).catch(done);
        })
    }

    return {
        checkAnimalCreation: checkAnimalCreation,
    };
};