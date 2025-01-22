import 'package:ecommerceapp/controller/homepage_controller.dart';
import 'package:ecommerceapp/core/constants/image_assets.dart';
import 'package:ecommerceapp/data/data_source/static/static.dart';
import 'package:ecommerceapp/view/widgets/homepage/slider_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/homepage/appbar/appbar_homepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myColors = Theme.of(context).colorScheme;
    var myTheme = Theme.of(context);
    var appHeight = Get.size.height;
    var appWidth = Get.size.width;

    HomePageController controller = Get.put(HomePageController());

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopify_rounded), label: "shop"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favorite"),
        ],
      ),
      body: SingleChildScrollView(
        // تمرير الصفحة بالكامل
        child: Column(
          children: [
            appbarHomepage(),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Row(
                children: [
                  Text(
                    "Special For You",
                    style: myTheme.textTheme.titleMedium, // استخدام الثيم هنا
                  ),
                  const Spacer(),
                  const Text("see all")
                ],
              ),
            ),
            SizedBox(
              height: appHeight * 0.2,
              child: ListView.builder(
                controller: controller.scrollcontroller,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, i) {
                  return Container(
                      width: appWidth >= 1200 ? appWidth * 0.4 : appWidth * 0.8,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: myColors.primary,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          SpecialForYouList[i].image!,
                          fit: BoxFit.cover,
                        ),
                      ));
                },
              ),
            ),
            SliderIndicatorHomePage(),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Row(
                children: [
                  Text(
                    "Categories",
                    style: myTheme.textTheme.titleMedium, // استخدام الثيم هنا
                  ),
                  const Spacer(),
                  const Text("see all")
                ],
              ),
            ),
            SizedBox(
              height: appWidth < 1200 ? appHeight * 0.110 : appHeight * 0.18,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: appWidth < 1200
                                ? appHeight * 0.078
                                : appHeight * 0.13,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(85, 177, 212, 232),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Icon(
                              Icons.shopping_cart_rounded,
                              color: myColors.primary,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "clothes",
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: appWidth < 1200
                  ? 20 / 2 * appHeight * 0.23
                  : 20 / 4 * appHeight * 0.23 + 1000, // تحديد ارتفاع GridView
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2,
                    crossAxisCount: appWidth >= 1200 ? 4 : 2),
                itemCount: 20,
                itemBuilder: (i, context) {
                  return LayoutBuilder(builder: (context, constraints) {
                    double cardHight = constraints.maxHeight;
                    print(cardHight);
                    print(appHeight * 0.23);
                    print(appHeight * 0.60);
                    return Card(
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            left: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                ImageAssets.product1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: GetBuilder<HomePageController>(
                              builder: (controller) => IconButton(
                                onPressed: () {
                                  controller.switchFavorite();
                                },
                                icon: Icon(
                                  controller.isFavorite
                                      ? Icons.favorite_border_outlined
                                      : Icons.favorite,
                                  color: myColors.primary,
                                ),
                                iconSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
