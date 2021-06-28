import 'package:remoute_mouse/configs.dart';
import 'package:remoute_mouse/logic/rest_api.dart';
import 'package:remoute_mouse/logic/udpClient.dart';

class Controller {
  final String ip;
  late final UDPConnection udpClient;
  late final RestApi restApi;
  Controller({
    required this.ip,
    udpPort = PORTudp,
    serverPort = PORTserver,
  }) {
    udpClient = UDPConnection(host: ip, port: udpPort);
    restApi = RestApi(domain: "$ip:$serverPort");
  }
}
