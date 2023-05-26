// ignore_for_file: no_duplicate_case_values

import 'dart:developer';

import 'package:eurisko_exam_nft/models/nft_item_model.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    log('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case NFTDetailsScreen.routeName:
        final data = settings.arguments as NFTItemModel?;
        return NFTDetailsScreen.route(data);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                  title: const Text(
                "Error",
                textAlign: TextAlign.center,
              )),
            ));
  }
}
