import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_kos/models/models.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpace() async {
    var result =
        await http.get('http://bwa-cozy.herokuapp.com/recommended-spaces');

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> space = data.map((item) => Space.fromJson(item)).toList();
      return space;
    } else {
      return <Space>[];
    }
  }
}
