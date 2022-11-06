import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/enum/snackbar.dart';

setupSnackBar() {
  final service = locator<SnackbarService>();
  service.registerCustomSnackbarConfig(
      variant: SnackBarType.red,
      config: SnackbarConfig(
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        messageColor: Colors.white,
      ));
  service.registerCustomSnackbarConfig(
      variant: SnackBarType.blue,
      config: SnackbarConfig(
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue[900]!,
        messageColor: Colors.white,
      ));
  service.registerCustomSnackbarConfig(
      variant: SnackBarType.yellow,
      config: SnackbarConfig(
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.yellow[900]!,
        messageColor: Colors.white,
      ));
}
