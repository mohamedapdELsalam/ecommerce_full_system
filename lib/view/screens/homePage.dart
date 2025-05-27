import 'package:adminapp/data/data_source/static/control_panel_list.dart';
import 'package:adminapp/data/model/control_panel_model.dart';
import 'package:adminapp/view/widgets/homepage/admin_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("control panel")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: controlPanelList.length,
          itemBuilder: (context, i) {
            ControlPanelCardModel model = controlPanelList[i];
            return AdminCard(
              title: model.title,
              image: SvgPicture.asset(model.url, height: 50),
              onTap: model.onTap,
            );
          },
        ),
      ),
    );
  }
}
