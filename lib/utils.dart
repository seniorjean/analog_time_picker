import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  showMyDialog(BuildContext context, String text) {
    // flutter defined function

    showDialog(
      context: context,
      // return object of type AlertDialog
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text("Massage"),
        content: Text(text),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}

class TopPrograssBar extends StatelessWidget {
  final String? progressBarImagePath;

  TopPrograssBar({Key? key, this.progressBarImagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.0),
      alignment: Alignment.topCenter,
      height: 25,
      child: Image.asset(
        progressBarImagePath!,
        fit: BoxFit.fill,
      ),
    );
  }
}

class MyBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          )

      ),
    );
  }
}

class TopTitle extends StatelessWidget {
  final double? topMargin;
  final double? leftMargin;
  final String title;

  const TopTitle({
    Key? key,
    this.topMargin,
    this.leftMargin,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
        top: topMargin ?? 0.0,
        left: leftMargin ?? 0.0,
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  final VoidCallback? sendAction;
  final Icon buttonIcon;

  SendButton({Key? key, this.sendAction, required this.buttonIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        backgroundColor: Colors.black87,
        child: Icon(Icons.arrow_forward),
        onPressed: sendAction,
      ),
    );
  }
}