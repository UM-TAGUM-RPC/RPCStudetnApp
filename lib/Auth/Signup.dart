import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../Constants/Constants.dart';

final password = AutoDisposeStateProvider((ref) => true);
final confirmpassword = AutoDisposeStateProvider((ref) => false);

class Signup extends ConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obs1 = ref.watch(password);
    final obs = ref.watch(confirmpassword);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          toolbarHeight: 30,
          elevation: 0.0,
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            GoRouter.of(context).go("/login");
                          },
                          child: SvgPicture.asset(CtrlSvg.back)),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Back",
                        style: TextStyle(
                          color: CtrlColors.black,
                          fontFamily: "GeneralSans",
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "S",
                        style: TextStyle(
                          color: CtrlColors.red,
                          fontFamily: "GeneralSans",
                          fontSize: 36,
                        ),
                      ),
                      const Text(
                        "ign",
                        style: TextStyle(
                          color: CtrlColors.black,
                          fontFamily: "GeneralSans",
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "up",
                        style: TextStyle(
                          color: CtrlColors.black,
                          fontFamily: "GeneralSans",
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: SvgPicture.asset(
                          CtrlSvg.signupperson,
                          height: 30,
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 245,
                      child: Divider(
                        thickness: 1.0,
                        color: CtrlColors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, top: 30),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              floatingLabelStyle:
                                  const TextStyle(color: CtrlColors.red),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              labelText: "Email",
                              labelStyle: const TextStyle(
                                  fontFamily: "GeneralSansRegular",
                                  fontSize: 12,
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
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    const TextStyle(color: CtrlColors.red),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                labelText: "First Name",
                                labelStyle: const TextStyle(
                                    fontFamily: "GeneralSansRegular",
                                    fontSize: 12,
                                    color: Color(0xFF404042)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: SvgPicture.asset(
                                    CtrlSvg.idbadge,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    const TextStyle(color: CtrlColors.red),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                labelText: "Last Name",
                                labelStyle: const TextStyle(
                                    fontFamily: "GeneralSansRegular",
                                    fontSize: 12,
                                    color: Color(0xFF404042)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: SvgPicture.asset(
                                    CtrlSvg.idbadge,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              constraints: const BoxConstraints.tightFor(
                                width: 160,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF7F7F7),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    floatingLabelStyle:
                                        const TextStyle(color: CtrlColors.red),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    labelText: "Middle Name",
                                    labelStyle: const TextStyle(
                                        fontFamily: "GeneralSansRegular",
                                        fontSize: 12,
                                        color: Color(0xFF404042)),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: SvgPicture.asset(
                                        CtrlSvg.idbadge,
                                        height: 18,
                                        width: 18,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints.tightFor(
                                width: 160,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF7F7F7),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    floatingLabelStyle:
                                        const TextStyle(color: CtrlColors.red),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    labelText: "Mobile Number",
                                    labelStyle: const TextStyle(
                                        fontFamily: "GeneralSansRegular",
                                        fontSize: 12,
                                        color: Color(0xFF404042)),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: SvgPicture.asset(
                                        CtrlSvg.mobile,
                                        height: 18,
                                        width: 18,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              constraints: const BoxConstraints.tightFor(
                                width: 160,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF7F7F7),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    floatingLabelStyle:
                                        const TextStyle(color: CtrlColors.red),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    labelText: "ID Number",
                                    labelStyle: const TextStyle(
                                        fontFamily: "GeneralSansRegular",
                                        fontSize: 12,
                                        color: Color(0xFF404042)),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: SvgPicture.asset(
                                        CtrlSvg.idbadge,
                                        height: 18,
                                        width: 18,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints.tightFor(
                                width: 160,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF7F7F7),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    floatingLabelStyle:
                                        const TextStyle(color: CtrlColors.red),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    labelText: "1997-20-07",
                                    labelStyle: const TextStyle(
                                        fontFamily: "GeneralSansRegular",
                                        fontSize: 12,
                                        color: Color(0xFF404042)),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: SvgPicture.asset(
                                        CtrlSvg.idbadge,
                                        height: 18,
                                        width: 18,
                                      ),
                                    ),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          // constraints: const BoxConstraints.tightFor(
                          //   width: 160,
                          // ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            obscureText: obs1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    const TextStyle(color: CtrlColors.red),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                labelText: "Password",
                                labelStyle: const TextStyle(
                                    fontFamily: "GeneralSansRegular",
                                    fontSize: 12,
                                    color: Color(0xFF404042)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: SvgPicture.asset(
                                    CtrlSvg.lock,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    ref.read(password.notifier).state = !obs1;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: SvgPicture.asset(
                                      CtrlSvg.obscure1,
                                      height: 15,
                                      width: 15,
                                    ),
                                  ),
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          // constraints: const BoxConstraints.tightFor(
                          //   width: 160,
                          // ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            obscureText: obs,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    const TextStyle(color: CtrlColors.red),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                labelText: "Confirm Password",
                                labelStyle: const TextStyle(
                                    fontFamily: "GeneralSansRegular",
                                    fontSize: 12,
                                    color: Color(0xFF404042)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: SvgPicture.asset(
                                    CtrlSvg.lock,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    ref.read(confirmpassword.notifier).state =
                                        !obs;
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: SvgPicture.asset(
                                      CtrlSvg.notobscure,
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
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
                                    backgroundColor: const Color(0xFFEC4969),
                                  ),
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          fontFamily: 'GeneralSans',
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
