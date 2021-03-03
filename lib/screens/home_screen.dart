import 'package:flutter/material.dart';
import 'package:flutter_kos/config/config.dart';
import 'package:flutter_kos/models/models.dart';
import 'package:flutter_kos/providers/space_provider.dart';
import 'package:flutter_kos/widgets/bottom_navbar_item.dart';
import 'package:flutter_kos/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(screenHeight),
          _buildPopularCities(screenHeight),
          _buildRecommendedSpace(screenHeight, context),
          _buildTipsAndGuid(screenHeight),
        ],
      ),
      floatingActionButton: Container(
        height: 65,
        width: screenWidth - (2 * left),
        margin: EdgeInsets.symmetric(horizontal: left, vertical: left),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

SliverToBoxAdapter _buildTipsAndGuid(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.only(
        left: left,
        bottom: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tips & Guidance',
            style: regularTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TipsCard(
            Tips(
              id: 1,
              title: 'City GuidLines',
              imageUrl: 'assets/tips1.png',
              updateAt: '20 Apr',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TipsCard(
            Tips(
              id: 1,
              title: 'Jakarta Fairship',
              imageUrl: 'assets/tips2.png',
              updateAt: '11 Apr',
            ),
          )
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildRecommendedSpace(
    double screenHeight, BuildContext context) {
  var spaceProvider = Provider.of<SpaceProvider>(context);

  return SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.only(left: left, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recomended Space',
            style: regularTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
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
                        margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
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
        ],
      ),
    ),
  );
}

SliverToBoxAdapter _buildPopularCities(double screenHeight) {
  return SliverToBoxAdapter(
    child: Container(
      margin: EdgeInsets.only(left: 20, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular City',
            style: regularTextStyle.copyWith(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CityCard(
                  City(
                    id: 1,
                    name: 'Jakarta',
                    imageUrl: 'assets/city1.png',
                  ),
                ),
                SizedBox(width: 20),
                CityCard(
                  City(
                    id: 1,
                    name: 'Bandung',
                    imageUrl: 'assets/city2.png',
                    isPopuler: true,
                  ),
                ),
                SizedBox(width: 20),
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
        ],
      ),
    ),
  );
}

SliverPadding _buildHeader(double screenHeight) {
  return SliverPadding(
    padding: EdgeInsets.all(20),
    sliver: SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(
          top: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore Now',
              style: blackTextSyle.copyWith(
                fontSize: 24,
              ),
            ),
            Text(
              'Mencari Kosan yang cozy',
              style: greyTextSyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
