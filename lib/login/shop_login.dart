import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/Register/ShopeRegister.dart';

import '../shared/companent.dart';
import 'logincubit/logincubit.dart';
import 'logincubit/shopstate.dart';

class ShopLoginScreen extends StatelessWidget {
  ShopLoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopeLoginCubit(),
      child: BlocConsumer<ShopeLoginCubit, ShopeLoginState>(
        listener: (context, state) {
          if (state is loginSuccessState) {
            if (state.loginModel.status!) {
              print('message: ${state.loginModel.message!}');
              print('token: ${state.loginModel.data!.token}');
              Fluttertoast.showToast(
                  msg: state.loginModel.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              Fluttertoast.showToast(
                  msg: state.loginModel.message!,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              print(state.loginModel.message!);
            }
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Login Now To Browse Our Hot Offers',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontWeight: FontWeight.w100,
                            fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      defultTextForm(
                        textController: emailController,
                        type: TextInputType.emailAddress,
                        lable: 'Email Address',
                        onChange: (value) {
                          print(value);
                        },
                        onSubmet: (value) {
                          if (formKey.currentState!.validate()) {
                            ShopeLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passWordController.text);
                          }
                        },
                        prefix: Icons.email,
                        isPass: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "please enter your email address";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      defultTextForm(
                        textController: passWordController,
                        type: TextInputType.visiblePassword,
                        lable: 'Password',
                        onChange: (value) {
                          print(value);
                        },
                        onSubmet: (value) {
                          print(value);
                          if (formKey.currentState!.validate()) {
                            ShopeLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passWordController.text);
                          }
                        },
                        prefix: Icons.lock,
                        suffix: ShopeLoginCubit.get(context).suffix,
                        suffixPressed: () {
                          ShopeLoginCubit.get(context).changeIcon();
                        },
                        isPass: ShopeLoginCubit.get(context).isPassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "password is late match";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      ConditionalBuilder(
                        condition: state is! loginLoadingState,
                        builder: (context) => defultButton(
                            text: "login",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ShopeLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passWordController.text);
                              }
                            }),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don\'t Have an Account?"),
                          TextButton(
                              onPressed: () {
                                navigetorTo(context, ShopeRegister());
                              },
                              child: Text("Register".toUpperCase()))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
