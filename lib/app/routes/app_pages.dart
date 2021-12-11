import 'package:get/get.dart';

import 'package:flutter_firebase/app/modules/add-data/bindings/add_data_binding.dart';
import 'package:flutter_firebase/app/modules/add-data/views/add_data_view.dart';
import 'package:flutter_firebase/app/modules/edit-data/bindings/edit_data_binding.dart';
import 'package:flutter_firebase/app/modules/edit-data/views/edit_data_view.dart';
import 'package:flutter_firebase/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_firebase/app/modules/home/views/home_view.dart';
import 'package:flutter_firebase/app/modules/login/bindings/login_binding.dart';
import 'package:flutter_firebase/app/modules/login/views/login_view.dart';
import 'package:flutter_firebase/app/modules/reset_password/bindings/reset_password_binding.dart';
import 'package:flutter_firebase/app/modules/reset_password/views/reset_password_view.dart';
import 'package:flutter_firebase/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:flutter_firebase/app/modules/sign_up/views/sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DATA,
      page: () => AddDataView(),
      binding: AddDataBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DATA,
      page: () => EditDataView(),
      binding: EditDataBinding(),
    ),
  ];
}
