import 'package:flutter/material.dart';
import 'package:flutter_kos/models/models.dart';
import 'package:flutter_kos/pages/detail_page.dart';
import 'package:flutter_kos/providers/space_provider.dart';
import 'package:flutter_kos/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Space space;

  const MyApp({Key key, this.space}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        home: HomeScreen(),
        routes: <String, WidgetBuilder>{
          "/detailspace": (BuildContext context) => DetailPage(space: space)
        },
      ),
    );
  }
}
