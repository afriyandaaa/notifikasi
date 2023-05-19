import 'package:get/get.dart';
import 'package:notifikasi/app/routes/app_pages.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  void gantiPage(int i) async {
    switch (i) {
      case 1:
        pageIndex.value = i;
        Get.offAllNamed(Routes.ADD);
        break;
      case 2:
        pageIndex.value = i;
        Get.offAllNamed(Routes.PROFILE);
        break;
      default:
        pageIndex.value = i;
        Get.offAllNamed(Routes.HOME);
    }
  }
}
