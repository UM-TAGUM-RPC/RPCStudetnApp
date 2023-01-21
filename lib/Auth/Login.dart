// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Auth/Signup.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Constants/Routes.dart';

final obsecure = AutoDisposeStateProvider((ref) => true);

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obs = ref.watch(obsecure);

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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "W",
                            style: const TextStyle(
                              color: CtrlColors.red,
                              fontFamily: "GeneralSans",
                              fontSize: 48,
                            ),
                          ),
                          Text(
                            "elcome!",
                            style: TextStyle(
                              color: CtrlColors.black,
                              fontFamily: "GeneralSans",
                              fontSize: 48,
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
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Student’s App",
                          style: TextStyle(
                            color: CtrlColors.black,
                            fontFamily: "GeneralSansRegular",
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                        width: 195,
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
                            style: const TextStyle(
                              color: CtrlColors.red,
                              fontFamily: "GeneralSans",
                              fontSize: 36,
                            ),
                          ),
                          Text(
                            "ign in",
                            style: TextStyle(
                              color: CtrlColors.black,
                              fontFamily: "GeneralSans",
                              fontSize: 36,
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
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              floatingLabelStyle:
                                  TextStyle(color: CtrlColors.red),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                  fontFamily: "GeneralSansRegular",
                                  fontSize: 15,
                                  color: Color(0xFF404042)),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  CtrlSvg.email,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: CtrlColors.red),
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
                            obscureText: obs,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  CtrlSvg.password,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                              suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
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
                                  borderSide: BorderSide(color: CtrlColors.red),
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
                                      context.go('/home');
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
                                  GoRouter.of(context).go("/");
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
            ],
          ),
        ));
  }
}
