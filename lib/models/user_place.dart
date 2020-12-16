import 'dart:io';
import 'package:flutter/foundation.dart';

class UserPlace with ChangeNotifier {
  final String id;
  final String title;
  final File image;

  UserPlace({
    @required this.id,
    @required this.title,
    @required this.image,
  });
}
