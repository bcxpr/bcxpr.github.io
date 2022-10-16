import 'package:flutter/material.dart';

class ShopRowTwo extends StatelessWidget {
  const ShopRowTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                color: Colors.green,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
