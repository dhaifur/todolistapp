import 'dart:convert';
import 'dart:developer';

import 'package:crud_project/app/app.locator.dart';
import 'package:crud_project/app/enum/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.router.dart';
import '../../../app/model/user_model.dart';

class RegisterViewModel extends BaseViewModel {
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;
  bool? enableButton = false;
  String? errorMessage;
  final _navigationServices = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmController = TextEditingController();

  goHome() => _navigationServices.clearStackAndShow(Routes.homeView);

  Future<User?> signUp() async {
    try {
      var postData = await Dio()
          .post('http://18.143.166.24:3000/api/v1/auth/signup', data: {
        'username': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'confirm_password': confirmController.text
      });
      if (postData.statusCode == 201) {
        await _snackbarService.showCustomSnackBar(
            duration: Duration(seconds: 2),
            message: "${usernameController.text} are registered",
            variant: SnackBarType.blue);
        signIn();
      }
    } on DioError catch (err) {
      _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 2),
          message: "${err.response!.data['message']}",
          variant: SnackBarType.red);
    }
    notifyListeners();
  }

  checkUsername(String username) {
    if (username.length > 1) {
      enableButton = true;
    }
    notifyListeners();
  }

  cekObscurePassword() {
    obscureTextPassword = !obscureTextPassword;
    notifyListeners();
  }

  cekObscureConfirmPassword() {
    obscureTextConfirmPassword = !obscureTextConfirmPassword;
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
        await sharedPreferences.setString(
            'accessToken', postData.data['token']);
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
