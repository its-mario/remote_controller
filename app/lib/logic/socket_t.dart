import 'dart:io';

import 'package:remoute_app/configs.dart';

const ip = remoteIp;

var sock = Socket.connect(ip, 5008);
void sendpos(String x, String y) {
  sock.then((socket) {
    socket.writeln('$x $y');
  });
}

void destroy() {
  sock.then((socket) {
    socket.destroy();
  });
  sock = Socket.connect(ip, 5008);
}
