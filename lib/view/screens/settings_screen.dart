import 'package:ecommerceapp/core/screen_dimensions.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
import 'package:ecommerceapp/view/widgets/homepage/appbar/appbar_disktop.dart';
import 'package:ecommerceapp/view/widgets/settings/setttings_appbar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Responsible(mobile: SettingsAppbarHomepage(), desktop: AppBardesktop()),
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
                          onTap: settingOptionsList[index].ontap,
                          title: Text(
                            settingOptionsList[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onError),
                          ),
                          subtitle: Text(
                            settingOptionsList[index].suptitle,
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
    ]);
  }
}
