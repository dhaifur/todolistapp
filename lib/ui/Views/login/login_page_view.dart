import 'package:crud_project/ui/Views/login/login_page_viewmodel.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:sizer/sizer.dart';

class LoginPageView extends ViewModelBuilderWidget<LoginPageViewModel> {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  LoginPageViewModel viewModelBuilder(BuildContext context) =>
      LoginPageViewModel();

  @override
  void onViewModelReady(LoginPageViewModel viewModel) {
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
      BuildContext context, LoginPageViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60.h,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/4630.png",
                        width: 89.w,
                        height: 37.h,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Write Your Job List",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Login to Start Listing",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 1.5.h,
                  ),
                  TextFormField(
                    controller: viewModel.emailController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      // focusColor: Colors.blueAccent,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 1.3),
                      ),
                      hintText: "Input Username \/ Password",
                      labelText: "Username \/ Password",
                      labelStyle: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 17,
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                    ),
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  TextFormField(
                    controller: viewModel.passwordController,
                    cursorColor: Colors.black,
                    obscureText: viewModel.obscureText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(
                            color: Colors.blueAccent, width: 1.3),
                      ),
                      hintText: "Input Your Password",
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 15,
                      ),
                      prefixIcon: const Icon(
                        Icons.password_rounded,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => viewModel.cekObscure(),
                        icon: viewModel.obscureText
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 1
                        ? 'You Must Fill The Password'
                        : null,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        fixedSize: const Size(400, 50)),
                    onPressed: () => viewModel.signIn(),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      const Text("Don't Have An Account Yet? "),
                      ElevatedButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.all(0),
                              backgroundColor: Colors.orange[500],
                              fixedSize: Size(90, 14)),
                          onPressed: () => viewModel.goRegister(),
                          child: Text("Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
