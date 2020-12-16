import 'package:flutter/material.dart';

class LocationInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            Container(
              height: 180.0,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey,
                ),
              ),
              child: Text('No Location Chosen'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.location_on),
                  label: Text('Current Location'),
                  textColor: Theme.of(context).primaryColor,
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.map),
                  label: Text('Select Location'),
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
