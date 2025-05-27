// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

import '../../Constants/Constants.dart';
import '../../Controller/homepageController.dart';

class NotifScreen extends ConsumerWidget {
  const NotifScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<bool> isread = [false, true, false, true, false];
    final controller = ref.watch(homepagecontroller);
    return StreamBuilder<dynamic>(
        stream: controller.supabase
            .from("notifications")
            .stream(primaryKey: ['id']).eq("to_id", controller.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData == null &&
              snapshot.connectionState == ConnectionState.none) {}

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      await controller.supabase.from("notifications").update(
                          {"status": "read"}).eq("to_id", controller.id?? "");
                    },
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
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(4),
                              constraints: BoxConstraints(
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                border:
                                    snapshot.data[index]['status'] == "unread"
                                        ? Border.all(
                                            color: CtrlColors.red,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter)
                                        : null,
                                color: Color(0XFFF7F7F7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  StreamBuilder<dynamic>(
                                      stream: controller.supabase
                                          .from("users")
                                          .stream(primaryKey: ['id']).eq("id",
                                              snapshot.data![index]['from_id']),
                                      builder: (context, es) {
                                        if (es.hasData == null &&
                                            es.connectionState ==
                                                ConnectionState.none) {}
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            SizedBox(
                                              width: 100,
                                              height: 15,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      es.data?.length ?? 0,
                                                  itemBuilder: (context, i) {
                                                    return Text(
                                                      "${es.data[i]['firstName']} ${es.data[i]['lastName']}",
                                                      style: const TextStyle(
                                                        color: CtrlColors.red,
                                                        fontFamily:
                                                            "GeneralSans",
                                                        fontSize: 12,
                                                      ),
                                                    );
                                                  }),
                                            ),
                                            const Text(
                                              "Advisor:",
                                              style: TextStyle(
                                                color: Color(0xFF404042),
                                                fontFamily:
                                                    "GeneralSansRegular",
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: SingleChildScrollView(
                                      child: ReadMoreText(
                                        snapshot.data![index]['message'],
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
                                  ),
                                  snapshot.data![index]['status'] == "unread"
                                      ? InkWell(
                                          onTap: () async {
                                            await controller.supabase
                                                .from("notifications")
                                                .update({"status": "read"}).eq(
                                                    "id",
                                                    snapshot.data![index]
                                                        ['id']);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                        )
                                      : Container(),
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
            ),
          );
        });
  }
}
