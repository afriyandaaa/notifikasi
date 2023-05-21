import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationManager extends GetxController {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late tz.Location _location;

  Future<void> initNotification() async {
    tz.initializeTimeZones(); // Inisialisasi zona waktu
    _location = tz.local;

    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {},
    );
  }

  Future<void> simpleNotificationShow(
      String matkul, DateTime jamMulai, String ruang) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('Channel_id', 'Channel_title',
            priority: Priority.high,
            importance: Importance.max,
            icon: '@mipmap/ic_launcher',
            channelShowBadge: true,
            largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'));

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await notificationsPlugin.zonedSchedule(
      0,
      '${matkul}',
      'Ruangan : ${ruang} => 5 menit dari sekarang',
      tz.TZDateTime.from(jamMulai, tz.local),
      notificationDetails,
      // ignore: deprecated_member_use
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
