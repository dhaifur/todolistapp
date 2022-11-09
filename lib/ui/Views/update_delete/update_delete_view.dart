import 'package:crud_project/ui/Views/update_delete/update_delete_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../app/model/activities_model.dart';

class UpdateDeleteView extends ViewModelBuilderWidget<UpdateDeleteViewModel> {
  final int id;
  final Activity activity;

  UpdateDeleteView(this.id, this.activity);

  @override
  UpdateDeleteViewModel viewModelBuilder(BuildContext context) =>
      UpdateDeleteViewModel();

  @override
  void onViewModelReady(UpdateDeleteViewModel viewModel) {
    viewModel.title = activity.title;
    viewModel.description = activity.description;
    viewModel.date = activity.date;
    viewModel.time = activity.time;
  }

  @override
  Widget builder(
      BuildContext context, UpdateDeleteViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 43.h,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.2.h),
                child: Column(
                  children: [
                    Icon(
                      Icons.edit,
                      size: 25.w,
                      color: Colors.white,
                    ),
                    Center(
                        child: Text(
                      'Edit Activity',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                      ),
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: viewModel.titleController,
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
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    controller: viewModel.descriptionController,
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
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    controller: viewModel.dateController,
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
                        viewModel.dateController.text = formattedDate;
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
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    controller: viewModel.timeController,
                    readOnly: true,
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (pickedTime != null) {
                        String formattedTime =
                            "${pickedTime.hour.toString().padLeft(2, "0")}:${pickedTime.minute.toString().padLeft(2, "0")}";
                        viewModel.timeController.text = formattedTime;
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
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 90,
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                          ),
                          onPressed: () {
                            viewModel.updateData(activity.id!);
                          },
                          child: const Text(
                            "Edit Job",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 50,
                        child: ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              viewModel.deleteActivity(activity.id!);
                            },
                            child: Icon(Icons.delete,
                                size: 25, color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
