package com.example.app_mobile_sos

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.graphics.Color
import android.os.Build
import androidx.core.app.NotificationCompat
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import java.util.Random

class MyFirebaseMessagingService : FirebaseMessagingService() {

    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        super.onMessageReceived(remoteMessage)
        if (remoteMessage.data.isEmpty()) {
            showNotification(remoteMessage.notification!!.title, remoteMessage.notification!!.body)
        } else {
            showNotification(remoteMessage.data)
        }
    }

    private fun showNotification(data: Map<String, String>) {
        val title = data["title"].toString()
        val body = data["body"].toString()
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val CHENAL_ID = "com.example.app_mobile_sos.test"
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val notificationChannel = NotificationChannel(CHENAL_ID, "Notification", NotificationManager.IMPORTANCE_DEFAULT)
            notificationChannel.description = "EDM Channel"
            notificationChannel.enableLights(true)
            notificationChannel.lightColor = Color.BLUE
            notificationChannel.vibrationPattern = longArrayOf(0, 1000, 500, 1000)
            notificationManager.createNotificationChannel(notificationChannel)
        }
        val notificationBuilder = NotificationCompat.Builder(this, CHENAL_ID)
        notificationBuilder.setAutoCancel(true).setDefaults(Notification.DEFAULT_ALL)
                .setWhen(System.currentTimeMillis(
                ))
                .setSmallIcon(R.drawable.common_google_signin_btn_icon_dark)
                .setContentTitle(title)
                .setContentText(body)
                .setContentInfo("Info")
        notificationManager.notify(Random().nextInt(), notificationBuilder.build())
    }

    private fun showNotification(title: String?, body: String?) {
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val NOTIFICATION_CHENAL_ID = "com.example.app_mobile_sos.test"
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val notificationChannel = NotificationChannel(NOTIFICATION_CHENAL_ID, "Notification", NotificationManager.IMPORTANCE_DEFAULT)
            notificationChannel.description = "EDM Channel"
            notificationChannel.enableLights(true)
            notificationChannel.lightColor = Color.BLUE
            notificationChannel.vibrationPattern = longArrayOf(0, 1000, 500, 1000)
            notificationManager.createNotificationChannel(notificationChannel)
        }
        val notificationBuilder = NotificationCompat.Builder(this, NOTIFICATION_CHENAL_ID)
        notificationBuilder.setAutoCancel(true).setDefaults(Notification.DEFAULT_ALL)
                .setWhen(System.currentTimeMillis())
                .setSmallIcon(R.drawable.common_google_signin_btn_icon_dark)
                .setContentTitle(title)
                .setContentText(body)
                .setContentInfo("Info")
        notificationManager.notify(Random().nextInt(), notificationBuilder.build())
    }

    override fun onNewToken(s: String) {
        super.onNewToken(s)
    }
}