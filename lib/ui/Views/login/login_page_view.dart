import 'package:crud_project/ui/Views/login/login_page_viewmodel.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 70, 15, 0),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/4630.png",
                          width: 250,
                          height: 250,
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Write Your Job List",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Center(
                        child: Text(
                          "Login to Start Listing",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                    const SizedBox(
                      height: 20,
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
                    const SizedBox(
                      height: 20,
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
                      height: 8,
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
      ),
    );
  }
}
