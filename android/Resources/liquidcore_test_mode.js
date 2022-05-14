const {LiquidCore} = require('liquidcore')
var Tron = new (require('./tron'))();
var IOServer = new (require('./IOServer'))();
var response = require("./response");
const BException = require('./bexception');

setInterval(()=>{}, 1000);

console.log('start micro service ...');

// Listen for a request from the host for the '_call' event
LiquidCore.on( '_call', async (msg) => {

    try {
        let fData = msg.name.split(".");
        let result = false;
        if(fData[1].charAt(0) !== "_") {
            switch (fData[0]) {
                case "tron" :
                    result = (Tron[fData[1]] ? await Tron[fData[1]](msg.params) : false);
                    break;
                case "ioServer" :
                    if (IOServer[fData[1]]) {
                        result = await IOServer[fData[1]](msg.params);
                    } else if (IOServer.serverFunction.indexOf(fData[1]) > -1) {
                        result = await IOServer._callIOFunction(fData[1], msg.params);
                    }
                    break;

            }
        }

        if(result === false)
            await response._response(msg.name, "we don't have this function !", false, 500);

    }catch(err){
        if(err instanceof BException){
            await response._response(msg.name, err.msg, err.success, err.code);
        }else{
            await response._response(msg.name, err.message, false, 500);
        }
    }


});


(async ()=>{

    let tconnection = 0;
    do{
        console.log("try connect to tron '''test''' network");
        try{
            await Tron._setConfig('https://api.shasta.trongrid.io', 'THpzvLQXTDvYxok2qPzqoaaWbKgzkL8tzQ');

            await IOServer._setConfig(Tron.config['server']);
            break;
        }catch(e){
            console.log("ERR", e.message);
        }
    }while((tconnection++) < 4);


    console.log("OK");
    if(tconnection > 4){
        console.log("can not connect to tron server");
        process.exit(0);
        return;
    }

    // Ok, we are all set up.  Let the host know we are ready to talk
    await response._response('ready', Tron.config['platform_version'], true, 200);

})();








