import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
              color: Colors.black,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Image.asset('assets/logo.png'),
          ),
          RaisedButton(
            child: Text('Admin Login'),
            onPressed: () {
              Navigator.pushNamed(context, '/adminLogin');
            },
          ),
          RaisedButton(
            child: Text('Workshop Registration'),
            onPressed: () {
              Navigator.pushNamed(context, '/researchRegistration');
            },
          ),
          RaisedButton(
            child: Text('Journal Registration'),
            onPressed: () {
              Navigator.pushNamed(context, '/journalRegistration');
            },
          ),
          RaisedButton(
            child: Text('Conference Registration'),
            onPressed: () {
              Navigator.pushNamed(context, '/conferenceRegistration');
            },
          ),
        ],
      ),
    );
  }
}