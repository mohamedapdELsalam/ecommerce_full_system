import 'package:ecommerceapp/controller/notification_controller.dart';
import 'package:ecommerceapp/core/class/handlind_status_request.dart';
import 'package:ecommerceapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
        appBar: AppBar(
          title: Text("notifications"),
          actions: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  radius: 15,
                  child: GetBuilder<NotificationController>(
                      builder: (controller) => FittedBox(
                            child: Text(
                              "${controller.notifications.length}",
                              style: context.textTheme.bodySmall!
                                  .copyWith(color: context.secondaryColor),
                            ),
                          )),
                ))
          ],
        ),
        body: GetBuilder<NotificationController>(
            builder: (controller) => HandlingStatusRequest(
                  controller: controller,
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.all(5),
                    child: ListView.builder(
                      itemCount: controller.notifications.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            title: Text(
                                controller.notifications[i].notificationTitle!),
                            subtitle: Text(
                                controller.notifications[i].notificationBody!),
                            trailing: Text(Jiffy.parse(controller
                                    .notifications[i].notificationTime!)
                                .fromNow()),
                          ),
                        );
                      },
                    ),
                  ),
                )));
  }
}
