import 'package:faculty_research/service.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:faculty_research/widgets/primaryActionButton.dart';

class AdminHome extends StatefulWidget {
  AdminHome({Key key, this.title}) : super(key: key);
  String title;
  @override
  _AdminHomeState createState() {
    return _AdminHomeState();
  }
}

class _AdminHomeState extends State<AdminHome> {

  final _formKey = GlobalKey<FormState>();
  static final List<String> eventTypes = ['workshop', 'journal', 'conference'];

  String month;
  String year;
  String currentEvent = eventTypes[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: _buildBody(context),
      )
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Please Enter Month and Year to filter results.\nDefaults to generate all if not provided.',
            style: TextStyle(fontSize: 18, wordSpacing: 2),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text('Workshop'),
            leading: Radio(
              activeColor: Colors.black,
              value: eventTypes[0],
              groupValue: currentEvent,
              onChanged: (value) {
                setState(() {
                  currentEvent = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Journal'),
            leading: Radio(
              activeColor: Colors.black,
              value: eventTypes[1],
              groupValue: currentEvent,
              onChanged: (value) {
                setState(() {
                  currentEvent = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Conference'),
            leading: Radio(
              activeColor: Colors.black,
              value: eventTypes[2],
              groupValue: currentEvent,
              onChanged: (value) {
                setState(() {
                  currentEvent = value;
                });
              },
            ),
          ),
          Form(
            key: _formKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    validator: (value) {
                      setState(() {
                        month = value;
                      });
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                      hintText: "Month",
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    validator: (value) {
                      setState(() {
                        year = value;
                      });
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                      hintText: "Year",
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          PrimaryActionButton(
            child: Text('GENERATE CSV'),
            onPressed: () {
              _formKey.currentState.validate();
              var query = "";
              if(month != null) {
                query += "month=$month&";
              }
              if(year != null) {
                query += "year=$year";
              }
              String url = HttpService.url + "/admin/generate${currentEvent}CSV?" + query;
              launch(url);
            },
          )
        ],
      ),
    );
  }
}