import 'package:crud_project/ui/Views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import '../../Customs/custom_dialog.dart';
import '../../Shared/widget/card.dart';

class HomeView extends ViewModelBuilderWidget<HomeViewModel> {
  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.getActivity();
  }

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Job List"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return CustomDialogConfirmation(
                        title: "Log Out",
                        message: "Are you sure to log out?",
                        positive: "Yes",
                        negative: "No",
                        positiveconfirm: () {
                          Navigator.pop(context);
                          viewModel.logout();
                        },
                      );
                    });
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: viewModel.listActivity.length == 0
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text("Empty Job List"),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView.builder(
                itemCount: viewModel.listActivity.length,
                itemBuilder: (BuildContext context, int index) {
                  var activity = viewModel.listActivity[index];
                  return CardMaxWidth(
                    title: '${activity.title!}',
                    description: '${activity.description!}',
                    date: '${activity.date!}',
                    time: '${activity.time!}',
                    edit: () {
                      viewModel.editJob(activity.id, activity);
                    },
                    delete: () {
                      viewModel.deleteActivity(activity.id!, index);
                    },
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => viewModel.createJobListDialog(context),
        isExtended: true,
        label: const Text("Create Job List"),
        icon: const Icon(Icons.create),
      ),
    );
  }
}
