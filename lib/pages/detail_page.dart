import 'package:flutter/material.dart';
import 'package:flutter_kos/config/config.dart';
import 'package:flutter_kos/pages/error_page.dart';
import 'package:flutter_kos/widgets/facility_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_kos/models/models.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage({this.space});

  @override
  Widget build(BuildContext context) {
    //note: to get data from route
    final Space space = ModalRoute.of(context).settings.arguments;

    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        //throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: left),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextSyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$ ${space.price}',
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
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icon_start.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/icon_start.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/icon_start.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/icon_start.png',
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/icon_start.png',
                                  width: 20,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(left: left),
                        child: Text(
                          'My Facilities',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: left),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kitchen',
                              imageUrl: 'assets/icon_kitchen.png',
                              total: space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'bed room',
                              imageUrl: 'assets/icon_bedroom.png',
                              total: space.numberOfbedrooms,
                            ),
                            FacilityItem(
                              name: 'Big Lemari',
                              imageUrl: 'assets/icon_lemari.png',
                              total: space.numberOfCupboards,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.only(left: left),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos.map((item) {
                            return Container(
                              margin: EdgeInsets.only(left: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(left: left),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: left),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address}\n${space.city}',
                              style: greyTextSyle,
                            ),
                            InkWell(
                              onTap: () {
                                // launchUrl(
                                //     'https://g.page/susu-kurma-by-waroengsku?share');
                                launchUrl(space.mapUrl);
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: left),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * left),
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl('tel:${space.phone}');
                          },
                          child: Text(
                            'Book Now',
                            style: whiteTextSyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: left, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/btn_wishlist.png',
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
