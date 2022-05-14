package dev.bitfamily.app

import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Log
import de.blinkt.openvpn.OboloiVPN
import de.blinkt.openvpn.OnVPNStatusChangeListener
import de.blinkt.openvpn.core.OpenVPNService
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.*
internal enum class VpnStatus(var callMethod: String) {
    ProfileLoaded("profileloaded"), ProfileLoadFailed("profileloadfailed");
}

class MainActivity : FlutterActivity() {
    //    init var a: MicroService
    var chanelName = "com.darano.OpenVpnData"

    //    var chanelBitro = "com.darano.bitronet"
    var vpnPackageName = "de.blinkt.openvpn.core.OpenVPNService";
//    var btService="dev.bitfamily.app.EndlessService"

    fun isServiceRunning(context: Context, str: String): Boolean {
        Log.e("sd", "configureFlutterEngine: a" + "isServiceRunning run")

        val activityManager: ActivityManager =
            context.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val services: List<ActivityManager.RunningServiceInfo> =
            activityManager.getRunningServices(Int.MAX_VALUE)
        for (runningServiceInfo in services) {
            Log.e("Service_Running", "isServiceRunning: " + runningServiceInfo.service.className)
            if (runningServiceInfo.service.className == str) {
                return true
            }
        }
        return false
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            chanelName
        ).setMethodCallHandler { call, result ->
            try {
                OpenVPNService.INT = Intent(context, MainActivity::class.java)
                Log.e("call", "configureFlutterEngine: " + call.method)
                if (call.method == "getPlatformVersion") {
                    result.success("Android " + Build.VERSION.RELEASE)
                } else if (call.method == "init") {
                    vpn = OboloiVPN(this@MainActivity)
                    val response = HashMap<String, String>()
                    result.success(response)
                } else if (call.method == "lunch") {
                    val config = call.argument<String>("ovpnFileContent")
                    val expireAt = call.argument<String>("expireAt")
                    val user = call.argument<String>("user")
                    val pass = call.argument<String>("pass")
                    val country = call.argument<String>("country")
                    val profileId = "1226626262626262626"
                    //                        String timeOutInSeconds = call.argument("timeOutInSeconds");
                    if (vpn == null) {
                        result.error("-1", "OpenVpnPlugin not initialized", null)

                    }
                    if (config == null || config.isEmpty()) {
                        result.error("-2", "Null or Empty Vpn Config", null)
                    }
                    vpn!!.setOnVPNStatusChangeListener(object : OnVPNStatusChangeListener {
                        override fun onProfileLoaded(profileLoaded: Boolean) {
                            MethodChannel(
                                flutterEngine.dartExecutor.binaryMessenger, chanelName
                            ).invokeMethod(
                                if (profileLoaded) VpnStatus.ProfileLoaded.callMethod else VpnStatus.ProfileLoadFailed.callMethod,
                                null
                            )
                            if (profileLoaded) {
                                vpn!!.init()
                                result.success(null)
                            }
                        }

                        override fun onVPNStatusChanged(status: String) {
                            Log.e("ss", "onVPNStatusChanged: " + status)
                            Handler(Looper.getMainLooper()).post(Runnable {
                                MethodChannel(
                                    flutterEngine.dartExecutor.binaryMessenger, chanelName
                                ).invokeMethod(status, null)
                            })

                        }

                        override fun onConnectionStatusChanged(
                            duration: String,
                            lastPacketRecieve: String,
                            byteIn: String,
                            byteOut: String
                        ) {
                            Log.e("TAG", "onConnectionStatusChanged: " + duration)
                            val response = HashMap<String, String>()
                            response["duration"] = duration
                            response["lastPacketRecieve"] = lastPacketRecieve
                            response["byteIn"] = byteIn
                            response["byteOut"] = byteOut

                            MethodChannel(
                                flutterEngine.dartExecutor.binaryMessenger, chanelName

                            ).invokeMethod("connectionUpdate", response)

                        }

                    })

                    vpn!!.launchVPN(config, expireAt, user, pass, country, profileId, 999999)

                } else if (call.method == "stop") {
                    vpn?.init()
                    result.success(null)
                } else if (call.method == "check") {
                    Log.e("sd", "configureFlutterEngine: a" + "check run")
                    if (isServiceRunning(this, vpnPackageName)) {
                        result.success("true")

                    } else {
                        result.success("false")

                    }
                }
            } catch (err: Exception) {
                result.error("-10", err.toString(), "UnExpected error")
            }
        }

//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, chanelBitro).setMethodCallHandler { call, result ->
//            val catch = getSharedPreferences("FlutterSharedPreferences", 0);
//            if (call.method == "send") {
//
//                EndlessService.sendData(call.arguments.toString(), flutterEngine)
//            }else if (call.method=="init")
//            {
//                log("init")
//                log(isServiceRunning(this,btService).toString())
//                if(isServiceRunning(this,btService)){
//                    if (EndlessService.update) {
//                        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, chanelBitro).invokeMethod("rc", "ready")
//                    }else
//                    {
//                        EndlessService.update=false
//                        MethodChannel(EndlessService.flutterEngine.dartExecutor.binaryMessenger, chanelBitro).invokeMethod("er", "UpdateApp")
//                    }
//                }else
//                {
//                    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, chanelBitro).invokeMethod("updateSignal", "run")
//                    EndlessService.initFlutter(flutterEngine)
//                    actionOnService(Actions.START)
//                }
//            }
//        }


    } // This static function is optional and equivalent to onAttachedToEngine. It supports the old

//    private fun actionOnService(action: Actions) {
//        if (getServiceState(this) ==   ServiceState.STOPPED && action == Actions.STOP) return
//        val thread: Thread = object : Thread() {
//            override fun run() {
//                Intent(applicationContext, EndlessService::class.java).also {
//                    it.action = action.name
//                    startService(it)
//                }
//            }
//        }
//        thread.start()
//
//    }


    //    override fun onDestroy() {
//        super.onDestroy()
//        Intent(applicationContext, EndlessService::class.java).also {
//            it.action = Actions.STOP.name
//            stopService(it)
//        }
//    }
    companion object {
        /// The MethodChannel that will the communication between Flutter and native Android
        ///
        /// This local reference serves to register the plugin with the Flutter Engine and unregister it
        /// when the Flutter Engine is detached from the Activity
        private var vpn: OboloiVPN? = null
        fun setPermission(permit: Boolean) {
            if (vpn != null) vpn!!.onPermissionChanged(permit)
        }
    }
}
