import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:faculty_research/service.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RaisedButton(
        child: Text('get csv'),
        onPressed: () async {
          await launch(HttpService.url + '/admin/generateworkshopCSV');
        },
      ),
    );
  }
}