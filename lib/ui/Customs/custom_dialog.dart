import 'package:flutter/material.dart';

class CustomDialogConfirmation extends StatefulWidget {
  final String? title;
  final String? message;
  final String? positive;
  final String? negative;
  final Function()? positiveconfirm;

  const CustomDialogConfirmation(
      {super.key,
      this.title,
      this.message,
      this.positive,
      this.negative,
      this.positiveconfirm});

  @override
  State<CustomDialogConfirmation> createState() =>
      _CustomDialogConfirmationState();
}

class _CustomDialogConfirmationState extends State<CustomDialogConfirmation> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title!),
      content: SingleChildScrollView(
        child: ListBody(children: <Widget>[Text(widget.message!)]),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          onPressed: () => Navigator.pop(context, false),
          child: Text(
            widget.negative!,
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent,
          ),
          onPressed: widget.positiveconfirm,
          child: Text(widget.positive!),
        ),
      ],
    );
  }
}
