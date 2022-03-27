import 'package:damco/helper/networkHelper.dart';

import '../constants/networkConstants.dart';
import 'package:http/http.dart' as http;

class Networks {
  Future<String?> serachColors(String keyword) async {
    Uri url = NetworkConstants.getColorSearchUrl(keyword);
    http.Response? response =
        await NetworkHelper().request(RequestType.get, url);

    if (response == null) {
      //SnapPeUI().toastError();
      return null;
    }
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //SnapPeUI().toastError(message: "SomeThing Wrong. ${response.statusCode}");
      return null;
    }
  }
}
