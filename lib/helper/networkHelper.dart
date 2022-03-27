import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

enum RequestType { get, post, put, delete }

class NetworkHelper {
  Future<http.Response?> request(RequestType requestType, Uri uri,
      {String requestBody = "", bool isLiveAgentReq = false}) async {
    EasyLoading.show(status: "Loading");
    print("Request - $requestType Url - $uri");
    print("RequestBody - $requestBody");

    String? token = ""; //await SharedPrefsHelper().getToken();
    Map<String, String> defaultHeader = {
      "Content-Type": "application/json",
      "token": token
    };

    http.Response? response;
    try {
      switch (requestType) {
        case RequestType.get:
          response = await http.get(uri, headers: defaultHeader);
          break;
        case RequestType.post:
          response =
              await http.post(uri, body: requestBody, headers: defaultHeader);
          break;
        case RequestType.put:
          response =
              await http.put(uri, body: requestBody, headers: defaultHeader);
          break;
        case RequestType.delete:
          response =
              await http.delete(uri, body: requestBody, headers: defaultHeader);
          break;
      }

      print("Response Code - ${response.statusCode}");
      print("Response Body - ${response.body}");
      EasyLoading.dismiss();

      return response;
    } catch (ex) {
      EasyLoading.dismiss();
      print("Network Error - $ex");
      return response;
    }
  }
}
