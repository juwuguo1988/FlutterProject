import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: Text(
            'AlertDialog',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          color: Colors.green,
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("this is AlertDialog!!!"),
            title: Center(
              child: Text(
                '标题',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text(
                  '确定'
                ),
              ),
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text(
                    '取消'
                ),
              )
            ],
          );
        });
  }
}
