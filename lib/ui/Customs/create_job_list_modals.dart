// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateJobListModals extends StatefulWidget {
  final titleController;
  final descriptionController;
  final dateController;
  final timeController;
  final Function()? createJob;
  final Function()? close;

  const CreateJobListModals(
      {super.key,
      required this.titleController,
      required this.descriptionController,
      required this.dateController,
      required this.timeController,
      this.createJob,
      this.close});

  @override
  State<CreateJobListModals> createState() =>
      _CreateJobListModalsState();
}

class _CreateJobListModalsState extends State<CreateJobListModals> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: ListView(children: [
      Container(
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 15, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 75,
                  ),
                  IconButton(
                      onPressed: widget.close,
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ],
              ),
              Icon(Icons.create_new_folder_outlined,
                  size: 100, color: Colors.white),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text("Create Job List",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 35,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: widget.titleController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value == null || value.length < 1
                  ? 'You Must Fill The Title'
                  : null,
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                hintText: "Input Title",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 3,
              controller: widget.descriptionController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value == null || value.length < 1
                  ? 'You Must Fill The Description'
                  : null,
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blueAccent),
                ),
                hintText: "Input Description",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: widget.dateController,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2023));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  widget.dateController.text = formattedDate;
                }
              },
              decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  icon: Icon(Icons.calendar_today),
                  hintText: "Input Job Date"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: widget.timeController,
              readOnly: true,
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());

                if (pickedTime != null) {
                  String formattedTime =
                      "${pickedTime.hour.toString().padLeft(2, "0")}:${pickedTime.minute.toString().padLeft(2, "0")}";
                  widget.timeController.text = formattedTime;
                }
              },
              decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  icon: Icon(Icons.watch_later_outlined),
                  hintText: "Input When The Job Must Done"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  fixedSize: const Size(400, 50)),
              onPressed: widget.createJob,
              child: const Text(
                "Create Job",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    ]));
  }
}
