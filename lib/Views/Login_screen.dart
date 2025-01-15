// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/Cubit/auth_cubit.dart';

import 'package:task_app/Cubit/auth_states.dart';
import 'package:task_app/Views/Home.dart';
import 'package:task_app/Widget/CustomBottom.dart';
import 'package:task_app/Widget/CustomTextField.dart';

import 'package:task_app/Widget/customtextfiled.dart';

class Login_Page extends StatelessWidget {
  Login_Page({super.key});

  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String? username;

  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Authcubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          Center(child: CircularProgressIndicator());
          BlocProvider.of<Authcubit>(context)
              .showSnackbar(context, 'Loading login', Colors.grey);
        } else if (state is LoginSucces) {
          BlocProvider.of<Authcubit>(context)
              .showSnackbar(context, 'Sucsses login', Colors.green);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        } else if (state is LoginFailure) {
          BlocProvider.of<Authcubit>(context)
              .showSnackbar(context, 'failure login ', Colors.red);
        } else {
          BlocProvider.of<Authcubit>(context)
              .showSnackbar(context, 'Try again login ', Colors.deepOrange);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      hinttext: 'Username',
                      onchange: (data) {
                        username = data;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customTextField(
                      controller: passwordcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      hinttext: 'Password',
                      onchange: (data) {
                        password = data;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomBottom(
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          await BlocProvider.of<Authcubit>(context).login(
                            username: username!,
                            password: password!,
                          );
                        }
                        passwordcontroller.clear();
                        emailcontroller.clear();
                      },
                      name: 'Login',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
