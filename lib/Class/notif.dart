import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static final NotificationServices _notificationService =
      NotificationServices._internal();

  factory NotificationServices() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationServices._internal();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@mipmap/icon_app");

    DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(
      int id, String title, String body, int seconds) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      const NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: 'Main channel notifications',
            importance: Importance.max,
            priority: Priority.max,
            icon: "@mipmap/ic_launcher"),
        iOS: DarwinNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      // uiLocalNotificationDateInterpretation:
      //     UILocalNotificationDateInterpretation.absoluteTime,
      // androidAllowWhileIdle: true,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
