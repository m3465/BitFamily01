const bip32 = require('bip32');
const bip39 = require('bip39');

module.exports = {
    generateMnemonic : ()=>{
        return bip39.generateMnemonic(128);
    },
    getAccountAtIndex : (mnemonic, index = 0) =>{
        const seed = bip39.mnemonicToSeedSync(mnemonic);
        const node = bip32.fromSeed(seed);
        const child = node.derivePath(`m/44'/195'/${index}'/0/0`);
        const privateKey = child.privateKey.toString('hex');

        return privateKey;
    }, 
    validateMnemonic : (mnemonic) =>{
        return bip39.validateMnemonic(mnemonic);
    }
}
