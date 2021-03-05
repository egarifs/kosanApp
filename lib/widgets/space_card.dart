import 'package:flutter/material.dart';
import 'package:flutter_kos/config/config.dart';
import 'package:flutter_kos/models/models.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard({this.space});

  // SpaceCard(this.space);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/detailspace", arguments: space);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              18,
            ),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.network(
                    space.imageUrl,
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icon_start.png',
                              width: 22,
                              height: 22,
                            ),
                            Text(
                              '${space.ratting}/5',
                              style: whiteTextSyle.copyWith(
                                fontSize: 13,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  space.name,
                  overflow: TextOverflow.ellipsis,
                  style: blackTextSyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text.rich(
                  TextSpan(
                    text: '\$${space.price}',
                    style: purpleTextSyle.copyWith(
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: '/month',
                        style: greyTextSyle.copyWith(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '${space.city}, ${space.country}',
                  style: greyTextSyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
