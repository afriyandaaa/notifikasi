import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notifikasi/app/controllers/page_index_controller.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  final pageC = Get.find<PageIndexController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.blue[800],
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        initialActiveIndex: controller.pageC.pageIndex.value,
        onTap: (int i) => controller.pageC.gantiPage(i),
      ),
    );
  }
}
