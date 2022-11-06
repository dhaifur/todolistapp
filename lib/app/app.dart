import 'package:crud_project/ui/Views/update_delete/update_delete_view.dart';
import 'package:crud_project/ui/Views/home/home_view.dart';
import 'package:crud_project/ui/Views/login/login_page_view.dart';
import 'package:crud_project/ui/Views/register/register_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginPageView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: UpdateDeleteView),
    MaterialRoute(page: RegisterView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
  ],
)
class AppSetup {}
