
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Connection established successfully!',
            ),
          ],
        ),
      ),
    );
  }

  goToHomePage() {
    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
  }
}