import 'package:flutter/material.dart';
import 'package:native_device_features2/providers/user_details_provider.dart';
import 'package:provider/provider.dart';

import './screens/user_places_screen.dart';
import './screens/add_places_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => UserDetails(),
      child: MaterialApp(
        title: 'User Native Device',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        debugShowCheckedModeBanner: false,
        home: UserPlacesScreen(),
        routes: {
          AddPlaces.routeName: (ctx) => AddPlaces(),
        },
      ),
    );
  }
}
