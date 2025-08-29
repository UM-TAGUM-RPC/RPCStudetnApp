// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rpcstudentapp/Auth/Signup.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Constants/Validator.dart';
import 'package:rpcstudentapp/Controller/loginController.dart';

final obsecure = AutoDisposeStateProvider((ref) => true);

class Login extends ConsumerStatefulWidget {
  const Login({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final obs = ref.watch(obsecure);
    final controller = ref.watch(logincontroller);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          toolbarHeight: 60,
          elevation: 0.0,
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: loginkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "W",
                              style: TextStyle(
                                color: CtrlColors.red,
                                fontFamily: "GeneralSans",
                                fontSize: 48.sp,
                              ),
                            ),
                            Text(
                              "elcome!",
                              style: TextStyle(
                                color: CtrlColors.black,
                                fontFamily: "GeneralSans",
                                fontSize: 48.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "to Research and Publication Center",
                            style: TextStyle(
                              color: CtrlColors.black,
                              fontFamily: "GeneralSansRegular",
                              fontSize: 20.sp,
                            ),
                          ),
                          Text(
                            "Student’s App",
                            style: TextStyle(
                              color: CtrlColors.black,
                              fontFamily: "GeneralSansRegular",
                              fontSize: 20.sp,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          width: 195.w,
                          child: Divider(
                            thickness: 1.0,
                            color: CtrlColors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 30),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              "S",
                              style: TextStyle(
                                color: CtrlColors.red,
                                fontFamily: "GeneralSans",
                                fontSize: 36.sp,
                              ),
                            ),
                            Text(
                              "ign in",
                              style: TextStyle(
                                color: CtrlColors.black,
                                fontFamily: "GeneralSans",
                                fontSize: 36.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            TextFormField(
                              controller: controller.email,
                              validator: (value) => Validator.emptyField(value),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    TextStyle(color: CtrlColors.red),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    fontFamily: "GeneralSansRegular",
                                    fontSize: 15.sp,
                                    color: Color(0xFF404042)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: SvgPicture.asset(
                                    CtrlSvg.email,
                                    height: 18.h,
                                    width: 18.h,
                                  ),
                                ),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: CtrlColors.red),
                                    borderRadius: BorderRadius.circular(15.0)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CtrlColors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: CtrlColors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: controller.password,
                              validator: (value) => Validator.emptyField(value),
                              obscureText: obs,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    TextStyle(color: CtrlColors.red),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  fontFamily: "GeneralSansRegular",
                                  fontSize: 15,
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: SvgPicture.asset(
                                    CtrlSvg.password,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: InkWell(
                                    onTap: () {
                                      ref.read(obsecure.notifier).state = !obs;
                                    },
                                    child: SvgPicture.asset(
                                      CtrlSvg.obscure1,
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ),
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: CtrlColors.red),
                                    borderRadius: BorderRadius.circular(15.0)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CtrlColors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: CtrlColors.red,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                SizedBox(
                                  height: 50,
                                  width: 135,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        backgroundColor: Color(0xFFEC4969),
                                      ),
                                      onPressed: () {
                                        if (loginkey.currentState!.validate() ==
                                            true) {
                                          controller.login(
                                            context: context,
                                            
                                          );
                                        } else {
                                          return;
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                              fontFamily: 'GeneralSans',
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 200,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Don’t have an Account Yet?",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: "GeneralSans",
                                    fontSize: 11,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  child: Text(
                                    "Sign Up now",
                                    style: TextStyle(
                                      color: CtrlColors.red,
                                      fontFamily: "GeneralSans",
                                      fontSize: 11,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup()));
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Build Version : 1.0.0",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "GeneralSans",
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
