import 'package:eurisko_exam_nft/API/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/app_router.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DioClient(),
        )
      ],
      child: MaterialApp(
          title: 'NFT market',
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName),
    );
  }
}
