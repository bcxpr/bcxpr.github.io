import 'package:colour/colour.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Voucher POS',
                style: TextStyle(
                  fontSize: 30,
                  color: Colour('BBBBBB'),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            // Container(
            //   height: 50,
            //   width: 50,
            //   margin: EdgeInsets.all(0),
            //   decoration: BoxDecoration(
            //     // color:
            //     //   // Colors.white,
            //     // HexColor('#BB8A52'),
            //     color: Colors.black12,
            //     image: DecorationImage(
            //       image: AssetImage('assets/images/pi4png.png'),
            //       fit: BoxFit.fitWidth,
            //     ),
            //     // shape: BoxShape.circle,
            //   ),
            // ),

            ClipRRect(
              child: Icon(
                Icons.grade,
                size: 40,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Text(
                  'Martin Shungoh',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colour('BBBBBB'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  child: Icon(
                    Icons.account_circle_outlined,
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
        )

        // Center(
        //   child: Text('VoucherPOS'),
        // ),
        );
  }
}
