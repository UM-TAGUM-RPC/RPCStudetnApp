import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'ID: ',
                    style: TextStyle(
                        fontFamily: 'GeneralSansRegular',
                        color: CtrlColors.black,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '1234543',
                    style: TextStyle(
                        fontFamily: 'GeneralSans',
                        color: CtrlColors.red,
                        fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
             Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'D',
                          style: TextStyle(
                              fontFamily: 'GeneralSans',
                              color: CtrlColors.red,
                              fontSize: 40),
                        ),
                        const Text(
                          'ignadice,',
                          style: TextStyle(
                              fontFamily: 'GeneralSans',
                              color: CtrlColors.black,
                              fontSize: 40),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Jayce',
                          style: TextStyle(
                              fontFamily: 'GeneralSans',
                              color: CtrlColors.black,
                              fontSize: 40),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Mico',
                          style: TextStyle(
                              fontFamily: 'GeneralSans',
                              color: CtrlColors.black,
                              fontSize: 40),
                        ),
                      ],
                    ),
                  ],
                ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 130, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Email: ',
                      style: TextStyle(
                          fontFamily: 'GeneralSansRegular',
                          color: CtrlColors.black,
                          fontSize: 13),
                    ),
                    const Text(
                      'jaycemico@gmail.com',
                      style: TextStyle(
                          fontFamily: 'GeneralSans',
                          color: CtrlColors.red,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Mobile Number: ',
                      style: TextStyle(
                          fontFamily: 'GeneralSansRegular',
                          color: CtrlColors.black,
                          fontSize: 13),
                    ),
                    const Text(
                      '09309094441',
                      style: TextStyle(
                          fontFamily: 'GeneralSans',
                          color: CtrlColors.red,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Birthday: ',
                      style: TextStyle(
                          fontFamily: 'GeneralSansRegular',
                          color: CtrlColors.black,
                          fontSize: 13),
                    ),
                    const Text(
                      'July 20, 1997',
                      style: TextStyle(
                          fontFamily: 'GeneralSans',
                          color: CtrlColors.red,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Advisor: ',
                      style: TextStyle(
                          fontFamily: 'GeneralSansRegular',
                          color: CtrlColors.black,
                          fontSize: 13),
                    ),
                    const Text(
                      'Jayce Mico Dignadice',
                      style: TextStyle(
                          fontFamily: 'GeneralSans',
                          color: CtrlColors.red,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'THESIS CODE: ',
                      style: TextStyle(
                          fontFamily: 'GeneralSansRegular',
                          color: CtrlColors.black,
                          fontSize: 13),
                    ),
                    const Text(
                      '123456634',
                      style: TextStyle(
                          fontFamily: 'GeneralSans',
                          color: CtrlColors.red,
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(CtrlSvg.logout),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'LOG OUT',
                            style: TextStyle(
                                fontFamily: 'GeneralSansRegular',
                                color: CtrlColors.black,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
