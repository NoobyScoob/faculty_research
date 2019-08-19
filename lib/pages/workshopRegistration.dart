import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:faculty_research/widgets/primaryActionButton.dart';
import 'package:faculty_research/service.dart';

class WorkshopRegistrationPage extends StatefulWidget {
  WorkshopRegistrationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WorkshopRegistrationPageState createState() => _WorkshopRegistrationPageState();
}

class _WorkshopRegistrationPageState extends State<WorkshopRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // form details
  String username;
  String userId;
  String workShopName;
  String venue;
  String date;
  String count;
  String fileName;
  String path;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(child: buildForm(context)),
    );
  }

  Widget buildForm(BuildContext scaffoldContext) {
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
                  workShopName = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Workshop Name",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Venue
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
            // Date
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
                hintText: "Start Date : dd/mm/yyyy",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // No of days
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                setState(() {
                  count = value;
                });
                return null;
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Number of days",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: _openFileExplorer,
                  child: Text('Choose Image'),
                ),
                SizedBox(width: 10,),
                Builder(
                  builder: (context) {
                    return Text(
                      fileName != null && path != null ? fileName : 'Please choose an Image',
                      style: fileName == null ? TextStyle(color: Colors.red) : null,
                    );
                  },
                )
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
                    "workshopName": workShopName,
                    "venue": venue,
                    "date": date,
                    "count": count,
                  };
                  HttpService().postWorkshopForm(formData, path).then((ok) {
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

  void _openFileExplorer() async {
    if(!mounted) return;
    path = await FilePicker.getFilePath(type: FileType.IMAGE);
    setState(() {
      fileName = path != null ? path.split('/').last : null;
    });
  }
}
