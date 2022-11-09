import 'package:crud_project/ui/Customs/create_job_list_modals.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../app/enum/snackbar.dart';
import '../../../app/model/activities_model.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationServices = locator<NavigationService>();
  final _snackbarServices = locator<SnackbarService>();
  final controllerTitle = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerTime = TextEditingController();
  List<Activity> listActivity = [];

  editJob(id, activity) =>
      _navigationServices.navigateTo(Routes.updateDeleteView,
          arguments: UpdateDeleteViewArguments(id: id, activity: activity));

  goLoginPage() => _navigationServices.clearStackAndShow(Routes.loginPageView);

  Future<Activity?> getActivity() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      var value = await sharedPreferences.get('accessToken');
      var result = await Dio().get(
        'http://18.143.166.24:3000/api/v1/activities',
        options: Options(
          headers: {
            'Authorization': 'Bearer $value',
          },
        ),
      );
      final activity = List<Activity>.from(
          result.data.map((element) => Activity.fromJson(element)));
      listActivity.addAll(activity);
    } on DioError catch (err) {
      _snackbarServices.showCustomSnackBar(
          duration: Duration(seconds: 2),
          message: "${err.response!.data['message']}",
          variant: SnackBarType.red);
    }
    notifyListeners();
  }

  createJobListDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext bc) {
          return CreateJobListModals(
            titleController: controllerTitle,
            descriptionController: controllerDescription,
            dateController: controllerDate,
            timeController: controllerTime,
            createJob: () {
              createJobList();
            },
            close: () async {
              await refresh();
              Navigator.pop(context);
              controllerTitle.text = 'Input Title';
              controllerDescription.text = 'Input Description';
              controllerDate.text = '';
              controllerTime.text = '';
            },
          );
        });
  }

  Future<Activity?> deleteActivity(int id, int index) async {
    try {
      listActivity.remove(index);
      final sharedPreferences = await SharedPreferences.getInstance();
      var value = await sharedPreferences.get('accessToken');
      var deleteData = await Dio().delete(
        'http://18.143.166.24:3000/api/v1/activities/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $value',
          },
        ),
      );
      if (deleteData.statusCode == 200) {
        _snackbarServices.showCustomSnackBar(
            duration: Duration(seconds: 2),
            message: "Delete Success",
            variant: SnackBarType.blue);
        refresh();
      }
    } on DioError catch (err) {
      _snackbarServices.showCustomSnackBar(
          duration: Duration(seconds: 2),
          message: "${err.response!.data['message']}",
          variant: SnackBarType.red);
    }
    notifyListeners();
  }

  Future<Activity?> createJobList() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      var value = await sharedPreferences.get('accessToken');
      var postData =
          await Dio().post('http://18.143.166.24:3000/api/v1/activities',
              data: {
                'title': controllerTitle.text,
                'description': controllerDescription.text,
                'date': controllerDate.text,
                'time': controllerTime.text
              },
              options: Options(headers: {
                'Authorization': 'Bearer $value',
              }));
      if (postData.statusCode == 201) {
        await _snackbarServices.showCustomSnackBar(
            duration: Duration(seconds: 2),
            message: "${controllerTitle.text} is in List",
            variant: SnackBarType.blue);
        controllerTitle.text = '';
        controllerDescription.text = '';
        controllerDate.text = '';
        controllerTime.text = '';
      }
    } on DioError catch (err) {
      _snackbarServices.showCustomSnackBar(
          duration: Duration(seconds: 2),
          message: "${err.response!.data['message']}",
          variant: SnackBarType.red);
    }
    notifyListeners();
  }

  Future refresh() async {
    listActivity.clear();
    await getActivity();
  }

  Future<Activity?> logout() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      var value = await sharedPreferences.get('accessToken');
      var postData =
          await Dio().post('http://18.143.166.24:3000/api/v1/auth/logout',
              options: Options(headers: {
                'Authorization': 'Bearer $value',
              }));
      if (postData.statusCode == 201) {
        sharedPreferences.clear();
        goLoginPage();
      }
    } on DioError catch (err) {
      _snackbarServices.showCustomSnackBar(
          duration: Duration(seconds: 2),
          message: "${err.response!.data['message']}",
          variant: SnackBarType.red);
    }
    notifyListeners();
  }
}
