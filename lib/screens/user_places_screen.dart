import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_places_screen.dart';
import '../providers/user_details_provider.dart';
import '../widgets/user_item.dart';

class UserPlacesScreen extends StatefulWidget {
  @override
  _UserPlacesScreenState createState() => _UserPlacesScreenState();
}

class _UserPlacesScreenState extends State<UserPlacesScreen> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDetails>(context, listen: false);
    userData.fetchItems();
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaces.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: userData.fetchItems(),
        builder: (BuildContext context, AsyncSnapshot snapShot) =>
            snapShot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<UserDetails>(
                    child: Center(
                      child: Text(
                        'Got no places yet, start adding some!',
                      ),
                    ),
                    builder: (ctx, userDetails, ch) =>
                        userDetails.items.length <= 0
                            ? ch
                            : UserItem(userData.items),
                  ),
      ),
    );
  }
}
