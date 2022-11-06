import 'package:crud_project/app/app.locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';
import '../../../app/enum/snackbar.dart';
import '../../../app/model/activities_model.dart';

class UpdateDeleteViewModel extends BaseViewModel {
  String? title;
  String? description;
  String? date;
  String? time;
  final _snackbarServices = locator<SnackbarService>();
  final _navigationServices = locator<NavigationService>();
  late final titleController = TextEditingController(text: title);
  late final descriptionController = TextEditingController(text: description);
  late final dateController = TextEditingController(text: date);
  late final timeController = TextEditingController(text: time);

  goHome() => _navigationServices.navigateTo(Routes.homeView);

  Future<Activity?> updateData(int id) async {
    try {
      final sharedPreference = await SharedPreferences.getInstance();
      var value = sharedPreference.get('accessToken');
      var postData = await Dio().put(
        'http://18.143.166.24:3000/api/v1/activities/$id',
        data: {
          'title': titleController.text,
          'description': descriptionController.text,
          'date': dateController.text,
          'time': timeController.text
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $value',
          },
        ),
      );
      if (postData.statusCode == 200) {
        await _snackbarServices.showCustomSnackBar(
            duration: Duration(seconds: 2),
            message: "Job is Update",
            variant: SnackBarType.blue);
        Future.delayed(Duration(seconds: 1), () {
          goHome();
        });
      }
    } on DioError catch (err) {
      _snackbarServices.showCustomSnackBar(
          duration: Duration(seconds: 2),
          message: "${err.response!.data['message']}",
          variant: SnackBarType.red);
    }
  }

  Future<Activity?> deleteActivity(int id) async {
    try {
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
        Future.delayed(Duration(seconds: 1), () {
          goHome();
        });
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
