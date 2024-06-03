import 'package:biodata/theme.dart';
import 'package:flutter/material.dart';

class BulletItem extends StatelessWidget {
  final String mainText;
  final String secondText;
  const BulletItem({super.key, required this.mainText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• "),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(mainText, style: blackTextStyle.copyWith(
              fontWeight: regular, fontSize: 12
            ),),
            Text(secondText, style: greyTextStyle.copyWith(
              fontWeight: light, fontSize: 10
            ),),
            const SizedBox(
              height: 10,
            )
          ],
        )
      ],
    );
  }
}