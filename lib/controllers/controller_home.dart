import 'package:damco/models/model_color.dart';
import 'package:damco/utils/networks.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<ColorModel> colorModel = <ColorModel>[].obs;
  HomeController() {}

  void serachColors(keyword) async {
    String? result = await Networks().serachColors(keyword);
    if (result != null) {
      colorModel.value = colorModelFromJson(result);
    }
  }
}
