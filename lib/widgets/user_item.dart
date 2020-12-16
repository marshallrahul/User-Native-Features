import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final List userData;

  UserItem(this.userData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userData.length,
      itemBuilder: (ctx, i) => Card(
        elevation: 10.0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            child: CircleAvatar(
              backgroundImage: FileImage(userData[i].image),
              radius: 20.0,
            ),
            radius: 23.0,
          ),
          title: Text(userData[i].title),
        ),
      ),
    );
  }
}
