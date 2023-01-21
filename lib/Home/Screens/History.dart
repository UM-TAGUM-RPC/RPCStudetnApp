import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';

class History extends ConsumerWidget {
  const History({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          "Advisor:",
                          style: TextStyle(
                            color: Color(0xFF404042),
                            fontFamily: "GeneralSansRegular",
                            fontSize: 10,
                          ),
                        ),
                        const Text(
                          "Jayce Mico",
                          style: TextStyle(
                            color: CtrlColors.red,
                            fontFamily: "GeneralSans",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "Current Status: ",
                              style: TextStyle(
                                color: Color(0xFF404042),
                                fontFamily: "GeneralSansRegular",
                                fontSize: 10,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 2.5),
                              child: Text(
                                "APPROVED",
                                style: TextStyle(
                                  color: CtrlColors.green,
                                  fontFamily: "GeneralSans",
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "OUTLINE DEFENSE",
                          style: TextStyle(
                            color: CtrlColors.red,
                            fontFamily: "GeneralSans",
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(
              width: double.infinity,
              child: Divider(
                thickness: 1.0,
                color: CtrlColors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 70,
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "Current Status:",
                              style: TextStyle(
                                color: Color(0xFF404042),
                                fontFamily: "GeneralSansRegular",
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Approved",
                              style: TextStyle(
                                color: CtrlColors.green,
                                fontFamily: "GeneralSanS",
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "APPROVAL OF TITLE",
                          style: TextStyle(
                            color: CtrlColors.red,
                            fontFamily: "GeneralSans",
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 70,
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              "Current Status:",
                              style: TextStyle(
                                color: Color(0xFF404042),
                                fontFamily: "GeneralSansRegular",
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Approved",
                              style: TextStyle(
                                color: CtrlColors.green,
                                fontFamily: "GeneralSanS",
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "OUTLINE DEFENSE",
                          style: TextStyle(
                            color: CtrlColors.red,
                            fontFamily: "GeneralSans",
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
