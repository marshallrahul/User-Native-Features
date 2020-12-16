import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/user_place.dart';
import '../helper/db_helper.dart';

class UserDetails with ChangeNotifier {
  List<UserPlace> _items = [];

  List<UserPlace> get items {
    return [..._items];
  }

  void addItems(String title, File image) {
    final newPlace = UserPlace(
      id: DateTime.now().toString(),
      title: title,
      image: image,
    );
    _items.insert(0, newPlace);
    notifyListeners();
    DBHelper.insertData('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchItems() async {
    final userData = await DBHelper.getUserData('user_places');
    _items = userData
        .map(
          (item) => UserPlace(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
