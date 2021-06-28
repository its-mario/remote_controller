import 'package:flutter/material.dart';

class TouchBar extends StatelessWidget {
  TouchBar({
    Key? key,
    this.pos = defaultPos,
    this.onClick = defaultOnClick,
    this.onPress,
  }) : super(key: key);

  final Function? onPress;
  final Function(num x, num y) pos;
  final Function(bool click) onClick;

  static void defaultPos(num x, num y) {
    print('|x: ${x.toStringAsFixed(3)} | Y: ${y.toStringAsFixed(3)}|');
  }

  static void defaultOnClick(bool click) {
    print("${click ? "Right" : "Left"} Button was pressed");
  }

  @override
  Widget build(BuildContext context) {
    double x = 0;
    double y = 0;
    double difx = 0;
    double dify = 0;

    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff8A8E91), borderRadius: BorderRadius.circular(22)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (onPress != null) onPress!();
                  onClick(false);
                },
                onLongPressStart: (info) {
                  onClick(true);
                },
                onPanStart: (DragStartDetails details) {
                  x = details.globalPosition.dx;
                  y = details.globalPosition.dy;
                },
                onPanUpdate: (details) {
                  difx = x - details.globalPosition.dx;
                  dify = y - details.globalPosition.dy;
                  x = details.globalPosition.dx;
                  y = details.globalPosition.dy;
                  //print(difx.toString() + '\n'  + dify.toString() );
                  //udpCo.sendPos(difx, dify);
                  pos(difx, dify);
                },
                onPanEnd: (details) {
                  x = 0;
                  y = 0;
                },
              ),
            ),
            Divider(
              color: Colors.black38,
            ),
            Container(
              height: 45,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  touchBarButton(false),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: VerticalDivider(
                      color: Colors.black38,
                    ),
                  ),
                  touchBarButton(true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget touchBarButton(bool side) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          //mouseclick(false);
          onClick(side);
        },
        child: Container(
          color: Colors.transparent,
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(side ? "Right" : "Left"),
            ],
          ),
        ),
      ),
    );
  }
}
