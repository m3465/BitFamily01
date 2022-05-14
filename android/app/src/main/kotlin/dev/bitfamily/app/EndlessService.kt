//package dev.bitfamily.app
//
//import android.R.attr.path
//import android.app.*
//import android.content.Context
//import android.content.Intent
//import android.graphics.Color
//import android.media.AudioAttributes
//import android.media.Ringtone
//import android.media.RingtoneManager
//import android.net.Uri
//import android.os.*
//import android.util.Log
//import android.widget.RemoteViews
//import androidx.core.app.NotificationCompat
//import io.flutter.embedding.engine.FlutterEngine
//import io.flutter.plugin.common.MethodChannel
//import org.json.JSONArray
//import org.json.JSONObject
//import org.liquidplayer.service.MicroService
//
//
//class EndlessService : Service() {
//    private var wakeLock: PowerManager.WakeLock? = null
//    private var isServiceStarted = false
//
//
//    companion object {
//        private init var context: Context
//        public var update = true
//        init var notificationManager : NotificationManager
//        @JvmStatic
//        private val sGeofenceCacheLock = Object()
//        // Not really needed since we can access the variable directly.
//        @JvmStatic fun getMyApplicationContext(): Context? {
//            return context
//        }
//        private val CHANNEL ="com.darano.bitronet"
//        init var micro: MicroService
//
//        init var flutterEngine: FlutterEngine
//        fun sendData(dataFun: String, flutterEngine: FlutterEngine) {
//            synchronized(sGeofenceCacheLock){
//            if(flutterEngine!=null)
//            {
//                this.flutterEngine=flutterEngine;
//            }
//            if(this::micro.isInitialized)
//            {
//                val funName=JSONObject(dataFun).getString("fun")
//            val data=JSONObject(dataFun).getString("data")
//                if(funName=="ioServer.getSignals")
//                {
//                     if( JSONObject(dataFun).getJSONObject("data").getString("page").toInt()==1)
//                    {
//                        val payload=JSONObject()
//                        payload.put("name", funName)
//                        if (data != "fl"){
//                            val param=JSONObject(dataFun).getJSONObject("data")
//                            payload.put("params", param)
//                        }
//
//                        val rn: Runnable = Runnable { // Do my stuff
//                            micro.emit("_call", payload)
//                        }
//                        val trd: Thread = Thread(rn)
//                        if(trd.isAlive())
//                        {
//                            trd.interrupt();
//                            trd.start();
//                        }else if(trd.getState()== Thread.State.NEW)
//                        {
//                            trd.start();
//                        }
//                    }else
//                    {
//                        val payload=JSONObject()
//                        payload.put("name", funName)
//                        if (data != "fl"){
//                            val param=JSONObject(dataFun).getJSONObject("data")
//                            payload.put("params", param)
//                        }
//
//                        log(payload.toString())
//                        val rn: Runnable = Runnable { // Do my stuff
//                            micro.emit("_call", payload)
//                        }
//                        val trd: Thread = Thread(rn)
//                        if(trd.isAlive())
//                        {
//                            trd.interrupt();
//                            trd.start();
//                        }else if(trd.getState()== Thread.State.NEW)
//                        {
//                            trd.start();
//                        }
//                    }
//                }else
//                {
//                      val payload=JSONObject()
//            payload.put("name", funName)
//            if (data != "fl"){
//                val param=JSONObject(dataFun).getJSONObject("data")
//                payload.put("params", param)
//            }
//                    log(payload.toString())
//                    val rn: Runnable = Runnable { // Do my stuff
//                        micro.emit("_call", payload)
//                    }
//                    val trd: Thread = Thread(rn)
//                    if(trd.isAlive())
//                    {
//                        trd.interrupt();
//                        trd.start();
//                    }else if(trd.getState()== Thread.State.NEW)
//                    {
//                        trd.start();
//                    }
//                }
//
//            }else
//            {
//                log(">>>init<<")
//
//                init()
//            }}
//
//        }
//        fun initFlutter(flu: FlutterEngine){
//         flutterEngine=flu
//        }
//
//        fun init()
//        {
//
//                                synchronized(sGeofenceCacheLock){
//                                    val uri = MicroService.Bundle(context, "/liquidcore_sample.js")
//                                    val startListener = MicroService.ServiceStartListener { service ->
//                                        service.addEventListener("_response", MicroService.EventListener { _, _, jsonObject ->
//
//                                            log(jsonObject.toString())
//                                            if (jsonObject.getString("name") == "ready" && jsonObject.getBoolean("success")) {
//                                                val catch = context.getSharedPreferences("FlutterSharedPreferences", 0);
//                                                if (flutterEngine != null) {
//                                                    Handler(Looper.getMainLooper()).post(Runnable {
//                                                        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("updateSignal", "run")
//                                                    })
//                                                    Handler(Looper.getMainLooper()).post(Runnable {
//                                                        val b = catch.getString("flutter.Signal.app/ve", null)
//                                                        if (checkVersion(jsonObject.getJSONObject("msg").getJSONArray("android"), b.toString())) {
//                                                            update = true
//                                                            if (flutterEngine != null)
//                                                                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("rc", "ready")
//                                                        } else {
//                                                            update = false
//                                                            if (flutterEngine != null)
//                                                                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("er", "UpdateApp")
//
//                                                        }
//                                                    })
//                                                }
//                                            }
//
//                                            if (jsonObject.getString("name") == "ioServer.welcome" && update) {
//                                                val catch = context.getSharedPreferences("FlutterSharedPreferences", 0);
//                                                Handler(Looper.getMainLooper()).post(Runnable {
//                                                    val payload = JSONObject()
//                                                    val b = catch.getString("flutter.Signal.app/Token", null)
//                                                    if (b != null && update) {
//                                                        if (flutterEngine != null) {
//                                                            Handler(Looper.getMainLooper()).post(Runnable {
//                                                                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("updateSignal", "run")
//                                                            })
//                                                        }
//                                                        payload.put("name", "ioServer.setIOToken")
//                                                        val par = JSONObject().put("IOToken", b)
//                                                        payload.put("params", par)
//                                                        micro.emit("_call", payload)
//                                                    }
//                                                })
//                                            }
//                                            if (jsonObject.getString("name") == "ioServer.alert_new_signal") {
//                                                Handler(Looper.getMainLooper()).post(Runnable {
//                                                    val catch = context.getSharedPreferences("FlutterSharedPreferences", 0);
//
//                                                    val b = catch.getBoolean("flutter.Signal.app/Signal", false)
//                                                    if (b) {
//                                                        if (flutterEngine != null) {
//                                                            Handler(Looper.getMainLooper()).post(Runnable {
//                                                                MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("updateSignal", "run")
//                                                            })
//                                                        }
//                                                    }
//                                                })
//                                            }
//                                            if (jsonObject.getString("name") != "ready" && jsonObject.getBoolean("success")) {
//
//                                                print("success")
//                                                if (flutterEngine != null && update) {
//                                                    Handler(Looper.getMainLooper()).post(Runnable {
//                                                        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("rc", jsonObject.toString())
//                                                    })
//                                                }
//
//                                            } else {
//
//                                                if (!jsonObject.getBoolean("success") && update) {
//                                                    Handler(Looper.getMainLooper()).post(Runnable {
//                                                        if (flutterEngine != null)
//                                                            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).invokeMethod("er", jsonObject.toString())
//                                                    })
//                                                }
//
//                                            }
//                                        })
//                                    }
//                                    micro = MicroService(context, uri, startListener)
//                                    micro.start()
//                                }
//
//
//
//        }
//        private fun  checkVersion(jsonArray: JSONArray, version: String):Boolean
//        {
//            for (j in 0 until jsonArray.length()) {
//                if(version==jsonArray[j])
//                return true
//            }
//            return  false
//        }
//        fun newHomeActivityStartIntent(context: Context): Intent {
//            val intent = Intent(context, MainActivity::class.java)
//            return intent
//        }
//    }
//
//    override fun onBind(intent: Intent): IBinder? {
//        return null
//    }
//    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
//        if (intent != null) {
//            val action = intent.action
//            when (action) {
//                Actions.START.name -> startService()
//                Actions.STOP.name -> stopService()
//                else -> log("This should never happen. No action in the received intent")
//            }
//        } else {
//            log(
//                    "with a null intent. It has been probably restarted by the system."
//            )
//        }
//        return START_STICKY
//    }
//
//    override fun onCreate() {
//        context = this
//        super.onCreate()
//    }
//
//    override fun onTaskRemoved(rootIntent: Intent) {
//        val restartServiceIntent = Intent(applicationContext, EndlessService::class.java).also {
//            it.setPackage(packageName)
//        }
//
//        val restartServicePendingIntent: PendingIntent = PendingIntent.getService(this, 1, restartServiceIntent, PendingIntent.FLAG_ONE_SHOT);
//        applicationContext.getSystemService(Context.ALARM_SERVICE);
//        val alarmService: AlarmManager = applicationContext.getSystemService(Context.ALARM_SERVICE) as AlarmManager;
//        alarmService.set(AlarmManager.ELAPSED_REALTIME, SystemClock.elapsedRealtime() + 1000, restartServicePendingIntent);
//    }
//
//    private fun startService() {
//        if (isServiceStarted) return
//        wakeLock =
//                (getSystemService(Context.POWER_SERVICE) as PowerManager).run {
//                    newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "EndlessService::lock").apply {
//                        acquire()
//                    }
//                }
//
//        Thread(Runnable {
//            isServiceStarted = true
//            setServiceState(this, ServiceState.STARTED)
//
//            // we need this lock so our service gets not affected by Doze Mode
//            wakeLock =
//                    (getSystemService(Context.POWER_SERVICE) as PowerManager).run {
//                        newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "EndlessService::lock").apply {
//                            acquire()
//                        }
//                    }
//
//            init()
//
//        }).start()
//    }
//    private fun stopService() {
//        try {
//            wakeLock?.let {
//                if (it.isHeld) {
//                    it.release()
//                }
//            }
//           stopForeground(true)
//            stopSelf()
//        } catch (e: Exception) {
//        }
//        isServiceStarted = false
//        setServiceState(this, ServiceState.STOPPED)
//    }
//}
//
