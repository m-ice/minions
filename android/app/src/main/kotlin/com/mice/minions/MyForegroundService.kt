package com.mice.minions

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Intent
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat

class MyForegroundService : Service() {
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val channelId = "my_foreground_channel"
        val channelName = "Foreground Service"

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                channelName,
                NotificationManager.IMPORTANCE_LOW
            )
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(channel)
        }

        val notification: Notification = NotificationCompat.Builder(this, channelId)
            .setContentTitle("服务正在运行")
            .setContentText("App 即使被杀死也能继续运行")
            .setSmallIcon(R.drawable.launch_background) // 换成你项目里的图标
            .build()

        startForeground(1, notification)
        var count=0
        // 在这里放你的后台逻辑，比如 BLE 保活、定时任务
        Thread {
            while (true) {
                try {
                    count++
                    Thread.sleep(5000)
                    println("后台服务仍在运行…$count")
                } catch (e: InterruptedException) {
                    break
                }
            }
        }.start()

        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? = null
}

