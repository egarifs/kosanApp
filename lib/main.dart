import 'package:flutter/material.dart';
import 'package:flutter_kos/providers/space_provider.dart';
import 'package:flutter_kos/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
