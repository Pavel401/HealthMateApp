import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:medica/Screens/Auth/components/components.dart';
import 'package:medica/Screens/Auth/components/under_part.dart';
import 'package:medica/Screens/Auth/constants.dart';
import 'package:medica/Screens/Auth/controllers/AuthController.dart';
import 'package:medica/Screens/Auth/screens/screens.dart';
import 'package:medica/Screens/Auth/widgets/widgets.dart';
import 'package:medica/helper/controllers/validator.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isobscureText = true;
  validators validator = Get.put(validators());

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController(context: context));

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(),
                FadeInUp(child: PageTitleBar(title: 'Login to your account')),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: FadeInUp(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // FadeInUp(
                          //   child: const Text(
                          //     "or use your email account",
                          //     style: TextStyle(
                          //         color: Colors.grey,
                          //         fontFamily: 'OpenSans',
                          //         fontSize: 13,
                          //         fontWeight: FontWeight.w600),
                          //   ),
                          // ),
                          Form(
                            key: authController.logInKey,
                            child: Column(
                              children: [
                                ///email field
                                FadeInUp(
                                    child: TextFieldContainer(
                                  child: TextFormField(
                                    controller: authController.emailController,
                                    cursorColor: kPrimaryColor,
                                    validator: (email) {
                                      if (validator
                                          .isValidEmail(email.toString()))
                                        return null;
                                      else
                                        return 'Enter a valid email';
                                    },
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.email,
                                          color: kPrimaryColor,
                                        ),
                                        hintText: "Email",
                                        hintStyle: const TextStyle(
                                            fontFamily: 'OpenSans'),
                                        border: InputBorder.none),
                                  ),
                                )),

                                ///password field
                                FadeInUp(
                                  child: TextFieldContainer(
                                    child: TextFormField(
                                      controller:
                                          authController.passwordController,
                                      obscureText: isobscureText,
                                      cursorColor: kPrimaryColor,
                                      validator: (password) {
                                        if (validator.isPasswordValid(
                                            password.toString()))
                                          return null;
                                        else
                                          return 'Enter a valid password';
                                      },
                                      decoration: InputDecoration(
                                          icon: Icon(
                                            Icons.lock,
                                            color: kPrimaryColor,
                                          ),
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(fontFamily: 'OpenSans'),
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              if (isobscureText == true) {
                                                isobscureText = false;
                                              } else {
                                                isobscureText = true;
                                              }
                                              Get.forceAppUpdate();
                                            },
                                            child: isobscureText
                                                ? Icon(
                                                    Icons.visibility_off,
                                                    color: kPrimaryColor,
                                                  )
                                                : Icon(
                                                    Icons.visibility,
                                                    color: kPrimaryColor,
                                                  ),
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                                // switchListTile(),
                                FadeInUp(
                                    child: RoundedButton(
                                        text: 'LOGIN',
                                        press: () {
                                          if (authController
                                              .logInKey.currentState!
                                              .validate()) {
                                            authController
                                                .sinUpKey.currentState!
                                                .save();
                                            // var _type = FeedbackType.success;
                                            // Vibrate.feedback(_type);
                                            authController.login(
                                                authController
                                                    .emailController.text,
                                                authController
                                                    .passwordController.text);

                                            // use the email provided here
                                          }
                                        })),
                                const SizedBox(
                                  height: 10,
                                ),
                                FadeInRight(
                                  child: UnderPart(
                                    title: "Don't have an account?",
                                    navigatorText: "Register here",
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpScreen()));
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // FadeInRight(
                                //   child: const Text(
                                //     'Forgot password?',
                                //     style: TextStyle(
                                //         color: kPrimaryColor,
                                //         fontFamily: 'OpenSans',
                                //         fontWeight: FontWeight.w600,
                                //         fontSize: 13),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: FadeInRight(
      child: SwitchListTile(
        dense: true,
        title: const Text(
          'Remember Me',
          style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
        ),
        value: true,
        activeColor: kPrimaryColor,
        onChanged: (val) {},
      ),
    ),
  );
}
