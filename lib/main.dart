import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notifikasi/app/controllers/page_index_controller.dart';
import 'package:notifikasi/app/utils/notification_manager.dart';

import 'app/routes/app_pages.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi NotificationManager dan daftarkan dengan GetX
  Get.put(NotificationManager());
  NotificationManager notificationManager = Get.find<NotificationManager>();
  await notificationManager.initNotification();

  final pageC = Get.put(PageIndexController(), permanent: true);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}