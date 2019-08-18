import 'package:flutter/material.dart';

import 'package:faculty_research/widgets/primaryActionButton.dart';

class ConferenceRegistrationPage extends StatefulWidget {
  ConferenceRegistrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConferenceRegistrationPageState createState() => _ConferenceRegistrationPageState();
}

class _ConferenceRegistrationPageState extends State<ConferenceRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // form details
  String username;
  String userId;
  String title;
  String venue;
  String issue;
  String date;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(child: buildForm()),
    );
  }

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // User Name
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  username = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "User Name",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // User ID
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  userId = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "User ID",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Workshop Name
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  title = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Title",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // venue
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  venue = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Venue",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // issue
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  issue = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Issue",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // date
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  date = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Date : Format dd-mm-yyyy",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PrimaryActionButton(
              onPressed: () {
                if(_formKey.currentState.validate()) {
                  setState(() {
                    _isLoading = true;
                  });
                  print(username);
                }
              },
              child: _isLoading ? CircularProgressIndicator(backgroundColor: Colors.white,) : Text('Submit Form'),
            ),
          ],
        ),
      ),
    );
  }
}
