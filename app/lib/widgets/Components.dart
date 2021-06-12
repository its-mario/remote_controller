import 'package:remoute_mouse/logic/key_press.dart';
import 'package:remoute_mouse/logic/socket_t.dart';
import 'package:flutter/material.dart';

class MyTouchBar extends StatelessWidget {
  double x = 0;
  double y = 0;
  double difx = 0;
  double dify = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
          color: Color(0xff8A8E91), borderRadius: BorderRadius.circular(22)),
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onPanStart: (details) {
                x = details.globalPosition.dx;
                y = details.globalPosition.dy;
              },
              onPanUpdate: (details) {
                difx = x - details.globalPosition.dx;
                dify = y - details.globalPosition.dy;
                x = details.globalPosition.dx;
                y = details.globalPosition.dy;
                //print(difx.toString() + '\n'  + dify.toString() );
                sendpos(difx.toStringAsFixed(3), dify.toStringAsFixed(3));
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
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      mouseclick(false);
                    },
                    child: Container(child: Center(child: Text("Left Click"))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: VerticalDivider(
                    color: Colors.black38,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      mouseclick(true);
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15),
                        child: Text("Right Click"),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RowOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("Power Off");
              sendcomand('esc');
            }, //for future function
            onDoubleTap: () {
              destroy();
            },
            child: Container(
              width: 73,
              height: 56,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                color: Color(0xff6D000A),
              ),
              child: Center(
                  child: Text(
                "Esc",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    sendcomand_combination('open');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xff2D2D34),
                    ),
                    width: 47,
                    height: 43,
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                GestureDetector(
                  onTap: () {
                    sendcomand_combination('close');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xff2D2D34),
                    ),
                    width: 47,
                    height: 43,
                    child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RowTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              sendcomand('left');
            },
            child: Container(
              height: 59,
              width: 59,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff2D2D34),
              ),
              child: Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
          ), //left key
          GestureDetector(
            onTap: () {
              sendcomand('space');
            },
            child: Container(
              height: 59,
              width: 94,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xff474A2C),
              ),
              child: Center(
                  child: Text(
                "Space",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )),
            ),
          ), //space key
          GestureDetector(
            onTap: () {
              sendcomand('right');
            },
            child: Container(
              height: 59,
              width: 59,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff2D2D34),
              ),
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
          ), //right key
        ],
      ),
    );
  }
}
