const TronWeb = require('tronweb');
const Mnemonic = require('./mnemonic');
const _ = require('lodash');
// const bcrypt = require('bcrypt');
var CAddress = "";
var Cnode = "";
const response = require('../response');

TronWeb.BigNumber().toNumber();

module.exports = class Client {
    
    async _setConfig(node, contractAddress) {
        
        Cnode = node;
        this.tronWeb = new TronWeb({
            fullHost: node,
            privateKey : '3fba0545c7025add93ca31564666340853297e42e121375ec66aa6c0a6341281' // main net
            // privateKey : '2d57db4f3a974e3dba14f9c934d67a37f7a7e6f83056f7171ff58c2a46d8159a' // shasta
        });

        this.configContract = await this.tronWeb.contract().at(contractAddress);
        let _config = await this.configContract.configs().call();
        
        this.config = JSON.parse(_config);

        CAddress = this.config['contract'];
        this.contract = await this.tronWeb.contract().at(CAddress);

    }

    async generateMnemonicAccount() {
        let mnemonic = await Mnemonic.generateMnemonic();
        await response._success({
            mnemonic
        })
    }


// mnemonic
    async generatePrivateKey(params) {
        (async ()=>{
          await response._response("tron.generatePrivateKey", Mnemonic.getAccountAtIndex(params.mnemonic), true, 200)
        })();
        
        return true;
    }

    // privateKey
    async getPublicKeyFromPrivateKey(params){
        await response._success(TronWeb.address.fromPrivateKey(params.privateKey));
    }

    // address
    async getAccount(params) {
        await response._success(await this.tronWeb.trx.getAccount(params.address).then(res => {
            return res;
        }));
    }

    // address
    async getAccountResources(params) {
        await response._success(await this.tronWeb.trx.getAccountResources(params.address));
    }

    // address
    async getBalance(params) {
        await response._success(await this.tronWeb.trx.getBalance(params.address));
    }

    
    // hex
    async fromHex(params) {
        await response._success(await TronWeb.address.fromHex(params.hex));
    }

    // hex
    async toHex(params) {
        await response._success(await TronWeb.address.toHex(params.hex));
    }

    // pk
    async isValidPrivateKey(params) {
        if (typeof params.pk !== 'string') return false;
        params.pk = params.pk.replace(/^0x/,'');
        let regex = /^[0-9a-fA-F]+$/g;
        if(!regex.test(params.pk) || params.pk.length !== 64) return false;
        let addr = TronWeb.address.fromPrivateKey(params.pk);
        await response._success(await TronWeb.isAddress(addr));
    }

    // address
    async isAddress(params) {
        await response._success(await TronWeb.isAddress(params.address));
    }

    // mnemonic
    async isValidMnemonic(params) {
        await response._success(await Mnemonic.validateMnemonic(params.mnemonic));
    }

    // address
    async getBtroPrfile(params){
        await response._success(await this.contract.users(params.address).call());
    }

    // address
    async getReferralChildren(params){
        await response._success(await this.contract.viewUserReferral(params.address).call());
    }

    // privateKey, refererAddress, password
    async registerIntoBtro(params){

        let _tron = new TronWeb({
            fullHost: Cnode,
            privateKey: params.privateKey
        })

        let _contract = await _tron.contract().at(CAddress);

        // let salt = await bcrypt.genSaltSync(10);
        // let passwd = await bcrypt.hashSync(params.password, salt);

        await response._success(await _contract.regUser(params.refererAddress, params.password).send({
            feeLimit: 120000000,
            callValue: 2000000000,
            shouldPollResponse: false
        }));
    }

    // privateKey, product_id
    async buyProduct(params){

        let _tron = new TronWeb({
            fullHost: Cnode,
            privateKey: params.privateKey
        })

        let _contract = await _tron.contract().at(CAddress);
        await response._success(await _contract.buyProduct(params.product_id).send({
                feeLimit: 120000000,
                callValue: 2000000000,
                shouldPollResponse: false
            }));
    }

    // privateKey, password
    async changePassword(params){
        console.log("—————»", params.password);
        let _tron = new TronWeb({
            fullHost: Cnode,
            privateKey: params.privateKey
        })

        let _contract = await _tron.contract().at(CAddress);

        await response._success(await _contract.setSecurityKey(params.password).send({feeLimit: 1000000000}));

    }

    // privateKey, to, amount
    async transferTRX(params) {
        let _tron = new TronWeb({
            fullHost: Cnode,
            privateKey : params.privateKey
        });
        await response._success(await _tron.trx.sendTransaction(params.to, params.amount));
    }

}