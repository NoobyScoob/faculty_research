import 'package:flutter/material.dart';

import 'package:faculty_research/widgets/primaryActionButton.dart';
import 'package:faculty_research/service.dart';

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
  String index;
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
              keyboardType: TextInputType.number,
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
            // index
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  index = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Index",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // date
            TextFormField(
              keyboardType: TextInputType.datetime,
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
                hintText: "Date : dd/mm/yyyy",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PrimaryActionButton(
              onPressed: _isLoading ? () {} : () {
                if(_formKey.currentState.validate()) {
                  setState(() {
                    _isLoading = true;
                  });
                  Map<String, dynamic> formData = {
                    "userName": username,
                    "userId": userId,
                    "indexed": index,
                    "venue": venue,
                    "date": date,
                    "title": title,
                  };
                  HttpService().postConferenceForm(formData).then((ok) {
                    print(ok);
                    if(ok) {
                      Navigator.pushNamed(context, '/success');
                    } else {
                      setState(() {
                        _isLoading = false;
                      });
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text('Network error, please try again later'),
                        )
                      );
                    }
                  });
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
