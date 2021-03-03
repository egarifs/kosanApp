import 'package:flutter/material.dart';
import 'package:flutter_kos/config/config.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int total;

  const FacilityItem({
    Key key,
    this.name,
    this.imageUrl,
    this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        Text.rich(
          TextSpan(
            text: '$total ',
            style: purpleTextSyle.copyWith(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: '$name',
                style: greyTextSyle.copyWith(
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
