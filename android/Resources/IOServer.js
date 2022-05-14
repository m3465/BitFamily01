const SocketIO = require('socket.io-client');
const encrypt = require('socket.io-encrypt');
const bexception = require('./bexception');
const response = require('./response')

module.exports = class IOServer {

    constructor(){
        this.serverFunction = [
            'getNewToken',
            'getSignals',
            'checkAuth',
            // just response
            'alert_new_signal'
        ];

        this.bindFunction = {};

        this.isGetFirstResponse = false;

        this.IOToken = "";

        this.auto_re_connect = null;

        this.IOServer = null;
    }

    async _setConfig(IOServer){
        this.IOServer = IOServer;
        this.bindFunction['welcome'] = (data)=>{this._welcome(data)};
        this.bindFunction['setToken'] = (data)=>{this._resSetToken(data)};
        this.bindFunction['logout'] = (data)=>{this._resLogOut(data)};
        this.io = await SocketIO(IOServer);
        encrypt("$2y$12$ueEf2H2r6lJNcEebBVIDuuvRXhMXxaxk1WUZwy7qdkImNmlyN02Pm")(this.io);
        this.io.on('_response', (data)=>{this._ioResponse(data)});

        this.io.on('disconnect', ()=>{
            this._response({
                name : 'disconnect',
                msg : 'disconnect',
                success : true,
                code : 200
            })
        })

        if(this.auto_re_connect !== null){
            clearInterval(this.auto_re_connect);
        }

        this.auto_re_connect = setInterval(()=>{
            console.log('re connect check ...');
            if(!this.io.connected){
                try{
                    this.io.disconnect();
                }catch(e){}
                this._setConfig(this.IOServer);
            }   

        }, 10000);

    }

    async _emit(name, params){
        this.io.emit("_call", {
            name: name,
            params : params
        })
    }

    async _callIOFunction(name, params){

        if(this.io.connected){
            await this._emit(name, params);
            return true;
        }else{
            await response._internalError("You are not connect to server !");
        }

    }

    async _ioResponse(data){

        if(data.name && data.name.charAt(0) !== "_"){
            if(this.serverFunction.indexOf(data.name) > -1){
                try {
                    await this._response(data);
                }catch (e) {
                    console.log("=========> _ioResponse : exception in response._response !" + data.name);
                }
            }else if(this.bindFunction[data.name]){
                await this.bindFunction[data.name](data);
            }else{
                console.log("=========> _ioResponse : I can not handle this response !" + data.name);
            }
        }else{
            console.log("=========> _ioResponse : I can not handle this response !" + data.name);
        }


    }

    async _welcome(data){
        this.isGetFirstResponse = true;
        if(this.IOToken.length > 0)
            await this._setToken();

        await this._response(data)
    }

    async setIOToken(data){
        this.IOToken = data.IOToken;
        if(this.isGetFirstResponse === true && this.io.connected){
            await this._setToken();
        }
        return true;
    }

    async getIOToken(){
        await response._success(this.IOToken);
    }

    async logOut(){
        this.IOToken = "";
        await this._emit('logout', {});
        return true;
    }

    async _resLogOut(data){
        await this._response(data);
    }

    async _setToken(){
        await this._emit('setToken', {
            token : this.IOToken
        })
    }

    async _resSetToken(data){

        if(data.code == 200 && data.success == true){
            this.IOToken = data.msg;
        }

        await this._response(data);
    }

    async _response(data){
        await response._response("ioServer." + data.name, data.msg, data.success, data.code);
    }

    async isConnecting(){
        await response._success(this.io.connected);
    }


}