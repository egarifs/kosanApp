import 'package:flutter/material.dart';
import 'package:flutter_kos/config/config.dart';

class BottomNavBarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  const BottomNavBarItem({
    Key key,
    this.imageUrl,
    this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 4,
                decoration: BoxDecoration(
                  color: purpleColor,
                ),
              )
            : Container()
      ],
    );
  }
}
