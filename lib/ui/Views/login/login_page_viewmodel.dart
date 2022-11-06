import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../app/enum/snackbar.dart';
import '../../../app/model/user_model.dart';

class LoginPageViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool obscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _snackbarService = locator<SnackbarService>();
  bool ischeck = false;

  goHome() => _navigationService.replaceWith(Routes.homeView);

  goRegister() => _navigationService.navigateTo(Routes.registerView);

  cekObscure() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future<User?> signIn() async {
    try {
      var postData = await Dio()
          .post('http://18.143.166.24:3000/api/v1/auth/login', data: {
        'username': emailController.text,
        'password': passwordController.text,
      });
      if (postData.statusCode == 201) {
        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('accessToken', postData.data['token']);
        goHome();
      }
    } on DioError catch (err) {
      _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 2),
          message: "${err.response!.data['message']}",
          variant: SnackBarType.red);
    }
    notifyListeners();
  }
}
