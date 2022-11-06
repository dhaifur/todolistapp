// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/Views/home/home_view.dart';
import '../ui/Views/login/login_page_view.dart';
import '../ui/Views/register/register_view.dart';
import '../ui/Views/update_delete/update_delete_view.dart';
import 'model/activities_model.dart';

class Routes {
  static const String loginPageView = '/';
  static const String homeView = '/home-view';
  static const String updateDeleteView = '/update-delete-view';
  static const String registerView = '/register-view';
  static const all = <String>{
    loginPageView,
    homeView,
    updateDeleteView,
    registerView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginPageView, page: LoginPageView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.updateDeleteView, page: UpdateDeleteView),
    RouteDef(Routes.registerView, page: RegisterView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    LoginPageView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginPageView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    UpdateDeleteView: (data) {
      var args = data.getArgs<UpdateDeleteViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => UpdateDeleteView(
          args.id,
          args.activity,
        ),
        settings: data,
      );
    },
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// UpdateDeleteView arguments holder class
class UpdateDeleteViewArguments {
  final int id;
  final Activity activity;
  UpdateDeleteViewArguments({required this.id, required this.activity});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToLoginPageView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.loginPageView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.homeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToUpdateDeleteView({
    required int id,
    required Activity activity,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.updateDeleteView,
      arguments: UpdateDeleteViewArguments(id: id, activity: activity),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRegisterView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.registerView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
