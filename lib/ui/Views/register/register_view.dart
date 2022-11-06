import 'package:crud_project/ui/Views/register/register_viewmodel.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends ViewModelBuilderWidget<RegisterViewModel> {
  @override
  RegisterViewModel viewModelBuilder(BuildContext context) =>
      RegisterViewModel();

  @override
  Widget builder(
      BuildContext context, RegisterViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  padding: const EdgeInsets.fromLTRB(10, 110, 15, 0),
                  child: Column(
                    children: [
                      Center(
                          child: Icon(
                        Icons.account_box_rounded,
                        size: 100,
                        color: Colors.white,
                      )),
                      const Center(
                        child: Text(
                          "Register Here",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
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
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: viewModel.usernameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value == null || value.length < 1
                          ? 'You Must Fill The Username'
                          : null,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        hintText: "Username (example: dhaifur)",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: viewModel.emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email'
                              : null,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        hintText: "Email (example: dhaifur@gmail.com)",
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: viewModel.passwordController,
                      obscureText: viewModel.obscureTextPassword,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        hintText: "Input Your Password",
                        suffixIcon: IconButton(
                          onPressed: () => viewModel.cekObscurePassword(),
                          icon: viewModel.obscureTextPassword
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
                    TextFormField(
                      controller: viewModel.confirmController,
                      obscureText: viewModel.obscureTextConfirmPassword,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                        hintText: "Confirm Your Password",
                        suffixIcon: IconButton(
                          onPressed: () =>
                              viewModel.cekObscureConfirmPassword(),
                          icon: viewModel.obscureTextConfirmPassword
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 1
                          ? 'You Must Fill The Password Again'
                          : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          fixedSize: const Size(400, 50)),
                      onPressed: () => viewModel.signUp(),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
