import 'package:flutter/material.dart';
import 'package:flutter_kos/config/config.dart';
import 'package:flutter_kos/models/city.dart';
import 'package:flutter_kos/models/models.dart';
import 'package:flutter_kos/providers/space_provider.dart';
import 'package:flutter_kos/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: left),
          child: ListView(
            children: [
              //note: Title/HEADER

              Padding(
                padding: EdgeInsets.only(left: left),
                child: Text(
                  'Explorer Now',
                  style: blackTextSyle.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 2),
              Padding(
                padding: EdgeInsets.only(left: left),
                child: Text(
                  'Mencari Kosan yang cozy',
                  style: greyTextSyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 30),
              //note: POPULAR CITY
              Padding(
                padding: EdgeInsets.only(left: left),
                child: Text(
                  'Popular City',
                  style: regularTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 24),
                    CityCard(
                      City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/city1.png',
                      ),
                    ),
                    SizedBox(width: 24),
                    CityCard(
                      City(
                        id: 1,
                        name: 'Bandung',
                        imageUrl: 'assets/city2.png',
                        isPopuler: true,
                      ),
                    ),
                    SizedBox(width: 24),
                    CityCard(
                      City(
                        id: 1,
                        name: 'Surabay ',
                        imageUrl: 'assets/city3.png',
                      ),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
              ),
              SizedBox(width: 30),
              //note: RECOMENDED SPACE
              Padding(
                padding: EdgeInsets.only(left: left),
                child: Text(
                  'Recomended Space',
                  style: blackTextSyle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: left),
                child: FutureBuilder(
                  future: spaceProvider.getRecommendedSpace(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Space> data = snapshot.data;

                      int index = 0;

                      return Column(
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                              top: index == 1 ? 0 : 30,
                            ),
                            child: SpaceCard(item),
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: left),
                child: Text('Tips & Guid'),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
