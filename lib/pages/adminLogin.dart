import 'package:faculty_research/widgets/primaryActionButton.dart';
import 'package:flutter/material.dart';

class AdminLoginPage extends StatefulWidget {
  AdminLoginPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AdminLoginPageState createState() {
    return _AdminLoginPageState();
  }
}

class _AdminLoginPageState extends State<AdminLoginPage> {

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String username;
  String password;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(child: _buildLoginForm(),),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Admin Login', style: TextStyle(fontSize: 54, shadows: [Shadow(color: Colors.grey, blurRadius: 1.0)]),),
                ],
              ),
              SizedBox(
                height: 20,
              ),
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
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  setState(() {
                    password = value;
                  });
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              PrimaryActionButton(
                onPressed: () {
                  if(_formKey.currentState.validate()) {
                    setState(() {
                      _isLoading = true;
                    });
                    if (this.username == "admin" && this.password == "password") {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pushNamed(context, '/adminHome');
                        setState(() {
                        _isLoading = false;
                      });
                      });
                    } else {
                      Future.delayed(Duration(seconds: 1), (){
                        setState(() {
                          _isLoading = false;
                        });
                        _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text('Username or Password might be incorrect'),
                          )
                        );
                      });
                    }
                  }
                },
                child: _isLoading ? CircularProgressIndicator(backgroundColor: Colors.white,) : Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}