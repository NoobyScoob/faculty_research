import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.popUntil(context, ModalRoute.withName('/'));
          return false;
        },
        child: _buildBody(),
      )
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Image.asset('assets/success.png', scale: 6,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Successfully Created', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ],
        ),
      ],
    );
  }
}