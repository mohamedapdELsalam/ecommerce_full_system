import 'package:ecommerceapp/controller/settings_controller.dart';
import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/data/data_source/static/settings_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(title: Text(LangKeys.settings.tr)),
      body: Column(children: [
        // Responsible(mobile: SettingsAppbarHomepage(), desktop: AppBardesktop()),
        SizedBox(height: 40),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    margin: EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List.generate(
                          settingOptionsList.length,
                          (index) => ListTile(
                            onTap: settingOptionsList[index].onTap,
                            title: Text(
                              settingOptionsList[index].title.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                            subtitle: Text(
                              settingOptionsList[index].subtitle.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                            trailing: settingOptionsList[index].trailing,
                            iconColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 1,
                    right: 1,
                    top: -25,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(100)),
                        padding: EdgeInsets.all(5),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: Icon(Icons.settings,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
