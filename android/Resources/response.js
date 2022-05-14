const BException = require('./bexception')

module.exports = class response{
    static async _response(name, msg, success, code){

        LiquidCore.emit( '_response', {
                    name : name,
                    msg : msg,
                    success : success,
                    code : (code ? code : 200)
                })

    }
    static async _return (msg, success, code){
        throw new BException(msg, success, code);
    }
    static async _success(msg){
        throw new BException(msg, true, 200);
    }
    static async _internalError(message){
        throw new BException((message ? message : "internal error"), false, 500);
    }
}