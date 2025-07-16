import 'package:ecommerceapp/core/constants/lang_keys.dart';
import 'package:ecommerceapp/data/data_source/static/profile_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LangKeys.profile.tr)),
      body: ListView(children: [
        SizedBox(height: 20),
        Padding(
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
                          profileList.length,
                          (index) => ListTile(
                            onTap: profileList[index].onTap,
                            title: Text(
                              profileList[index].title.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                            subtitle: Text(
                              profileList[index].subtitle.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey),
                            ),
                            trailing: profileList[index].trailing,
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
                          child: Icon(Icons.person,
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
