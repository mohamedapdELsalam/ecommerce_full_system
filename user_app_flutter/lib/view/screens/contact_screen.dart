import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("contact us"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 12,
                    child: FittedBox(child: Text("1")),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Card(
                    child: ListTile(
                      minTileHeight: 80,
                      title: Text("telephone"),
                      subtitle: Text("call us"),
                      trailing: Icon(Icons.call),
                      onTap: () async {
                        await launchUrl(Uri.parse("tel:01060324571"));
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CircleAvatar(
                    radius: 12,
                    child: FittedBox(child: Text("2")),
                  ),
                ),
                Flexible(
                  flex: 6,
                  child: Card(
                    child: ListTile(
                      minTileHeight: 80,
                      title: Text("whatsapp"),
                      subtitle: Text("chat us in whatsapp"),
                      trailing: SvgPicture.asset(SvgAssets.bellNotification),
                      onTap: () async {
                        await launchUrl(
                            Uri.parse("https://wa.me/201060324571"));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
