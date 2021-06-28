import 'package:remoute_mouse/logic/rest_api.dart';

void main() {
  var rest = RestApi(domain: "192.168.122.1:5005");
  rest.checkConnection().then((value) {
    print(
        value ? "CheckConnection passed succefuly" : "Checkconnection failed");
  });

  Future.delayed(Duration(seconds: 3));
  rest.click(true);
  print("click test...");
  Future.delayed(Duration(seconds: 3));
  rest.press(["win"]);
  print("Press test ...");
  print("exiting...");
  Future.delayed(Duration(seconds: 1));
}
// to finisish tests for rest_api