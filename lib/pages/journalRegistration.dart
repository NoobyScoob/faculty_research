import 'package:flutter/material.dart';

import 'package:faculty_research/widgets/primaryActionButton.dart';
import 'package:faculty_research/service.dart';

class JournalRegistrationPage extends StatefulWidget {
  JournalRegistrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JournalRegistrationPageState createState() => _JournalRegistrationPageState();
}

class _JournalRegistrationPageState extends State<JournalRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // form details
  String username;
  String userId;
  String journalTitle;
  String paperTitle;
  String volume;
  String issue;
  String date;
  bool isUGCListed = false;

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
            // Journal Title
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  journalTitle = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Journal Title",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // paperTitle
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  paperTitle = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Paper Title",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Volume
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  volume = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Volume",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // issue
            TextFormField(
              keyboardType: TextInputType.number,
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
            Row(
              children: <Widget>[
                Text("UGC Listed", style: TextStyle(fontSize: 16),),
                Switch(
                  value: isUGCListed,
                  onChanged: (value) {
                    isUGCListed = value;
                  },
                  activeTrackColor: Colors.black38,
                  activeColor: Colors.black,
                ),
              ],
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
                    "paperTitle": paperTitle,
                    "journalTitle": journalTitle,
                    "date": date,
                    "volume": int.parse(volume),
                    "issue": int.parse(issue)
                  };
                  print(formData);
                  HttpService().postJournalForm(formData).then((ok) {
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
