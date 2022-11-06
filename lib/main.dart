import 'package:crud_project/ui/Customs/setup_snackbar.dart';
import 'package:flutter/material.dart';

import 'app/app.locator.dart';
import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupSnackBar();
  runApp(const MyApp());
}
