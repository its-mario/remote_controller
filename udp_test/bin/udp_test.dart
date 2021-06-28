import 'dart:io';
import 'dart:convert';
import 'dart:math';

class UDPConnection {
  late final InternetAddress clientAddress;
  final int port;
  RawDatagramSocket? socket;

  UDPConnection({
    required String host,
    required this.port,
  }) {
    clientAddress = InternetAddress(host);
    RawDatagramSocket.bind(InternetAddress.anyIPv4, 0).then((value) {
      socket = value;
    });
  }

  void sendPos(num? dx, num? dy) async {
    var dict = {'dx': dx, 'dy': dy};
    var jsObject = jsonEncode(dict);

    var tries = 0;
    while (tries < 5) {
      tries += 1;
      if (socket != null) {
        socket!.send(Utf8Codec().encode(jsObject), clientAddress, port);
        return;
      } else {
        await Future.delayed(const Duration(seconds: 1));
        print('Wait a second the socket is not instanced! tries:$tries');
      }
    }
    if (tries > 5) {
      throw Exception(["The <socket> coldn't be instanced!"]);
    }
  }
}

void main() async {
  var udp = UDPConnection(host: '127.0.0.1', port: 20001);
  await Future.delayed(const Duration(seconds: 3));
  var max = 50;
  var min = -50;

  for (var i = 0; i < 20; i++) {
    var r1 = min + Random().nextInt(max - min);
    var r2 = min + Random().nextInt(max - min);
    udp.sendPos(r1, r2);
  }
  print('done');
}
