// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class CardMaxWidth extends StatefulWidget {
  final String? title;
  final String? description;
  final String? date;
  final String? time;
  final Function()? edit;
  final Function()? delete;

  const CardMaxWidth({
    Key? key,
    this.title,
    this.description,
    this.date,
    this.time,
    this.edit,
    this.delete,
  }) : super(key: key);

  @override
  State<CardMaxWidth> createState() => _CardMaxWidthState();
}

class _CardMaxWidthState extends State<CardMaxWidth> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[350]!, spreadRadius: 0, blurRadius: 1),
            ]),
        height: 180,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width - 135,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title!,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Text(widget.description!,
                        style: TextStyle(fontSize: 13, color: Colors.black)),
                    Text(widget.date!,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.orange[900],
                            fontWeight: FontWeight.bold)),
                    Text(widget.time!,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.orange[900],
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blueAccent,
                        ),
                        height: 50,
                        width: 70,
                        child: IconButton(
                            onPressed: widget.edit,
                            icon: Icon(
                              Icons.edit_note_outlined,
                              color: Colors.white,
                              size: 35,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red[800],
                        ),
                        height: 50,
                        width: 70,
                        child: IconButton(
                            onPressed: widget.delete,
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 25,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
