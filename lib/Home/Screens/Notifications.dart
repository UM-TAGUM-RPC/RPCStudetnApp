// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

import '../../Constants/Constants.dart';

class NotifScreen extends ConsumerWidget {
  const NotifScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<bool> isread = [false, true, false, true, false];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  'Mark as all read',
                  style: TextStyle(
                      fontFamily: 'GeneralSans',
                      color: Colors.grey,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                      ),
                      decoration: BoxDecoration(
                        border: isread[index] == false
                            ? Border.all(
                                color: CtrlColors.red,
                                strokeAlign: StrokeAlign.center)
                            : null,
                        color: Color(0XFFF7F7F7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            'Jayce Mico Dignadice',
                            style: TextStyle(
                                fontFamily: 'GeneralSans',
                                color: CtrlColors.red,
                                fontSize: 10),
                          ),
                          Text(
                            'Adviser',
                            style: TextStyle(
                                fontFamily: 'GeneralSansRegular',
                                color: CtrlColors.black,
                                fontSize: 10),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            child: ReadMoreText(
                              'Sa inyung presentation about sa title defense is okay, gi check nako then I pa check ninyo ug balik sa akoa ang akoang gipa edit nako sa inyo after ni.',
                              trimLines: 2,
                              colorClickableText: CtrlColors.red,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: '\n Read More',
                              trimExpandedText: 'Read Less',
                              lessStyle: TextStyle(
                                  fontFamily: 'GeneralSans',
                                  fontSize: 14,
                                  color: CtrlColors.red),
                              moreStyle: TextStyle(
                                  fontFamily: 'GeneralSans',
                                  fontSize: 14,
                                  color: CtrlColors.red),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Text(
                                  'Mark as read',
                                  style: TextStyle(
                                      fontFamily: 'GeneralSans',
                                      color: CtrlColors.black,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                );
              }),
        ],
      ),
    );
  }
}
