import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/user_details_provider.dart';
import '../widgets/location_input.dart';

class AddPlaces extends StatefulWidget {
  static const routeName = '/add-places';

  @override
  _AddPlacesState createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  final _titleController = TextEditingController();

  File _storedImage;
  // '/storage/emulated/0/Android/data/com.example.native_device_features2/files/Pictures/scaled_2a14a572-4473-4a7a-9df5-2b6665afb9627193656376198872515.jpg'

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (pickedFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(pickedFile.path);
    });
    final appDir = await syspaths
        .getApplicationDocumentsDirectory(); // '/data/user/0/com.example.native_device_features2/app_flutter'
    final fileName = path.basename(appDir.path); // app_flutter
    await _storedImage.copy('${appDir.path}/$fileName');
    // '/data/user/0/com.example.native_device_features2/app_flutter/app_flutter'
    // return saveImage;
  }

  void _addSelectedItem() {
    if (Provider.of<UserDetails>(context, listen: false).items == null ||
        _titleController.text.isEmpty) {
      return;
    }
    Provider.of<UserDetails>(context, listen: false).addItems(
      _titleController.text,
      _storedImage,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: _storedImage == null
                          ? Text(
                              'No Image Taken',
                              textAlign: TextAlign.center,
                            )
                          : Image.file(
                              _storedImage,
                              fit: BoxFit.cover,
                              width: 160,
                            ),
                    ),
                    FlatButton.icon(
                      onPressed: _takePicture,
                      icon: Icon(Icons.camera),
                      label: Text('Take Picture'),
                      textColor: Theme.of(context).accentColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          LocationInput(),
          RaisedButton.icon(
            onPressed: _addSelectedItem,
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
