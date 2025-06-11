import 'package:adminapp/controller/categories/add_category_controller.dart';
import 'package:adminapp/core/functions/validate_inputs.dart';
import 'package:adminapp/view/widgets/Auth/auth_button.dart';
import 'package:adminapp/view/widgets/Auth/auth_textForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adminapp/core/functions/svg_loader.dart';


class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    AddCategoryController controller = Get.put(AddCategoryController());
    return Scaffold(
      appBar: AppBar(title: Text("Add Category")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          SizedBox(height: 10),
          GetBuilder<AddCategoryController>(
            builder:
                (controller) => CircleAvatar(
                  backgroundColor:
                      controller.categImage == null
                          ? ColorScheme.of(context).primary
                          : Colors.white,
                  radius: 40,
                  child:
                      controller.categImage == null
                          ? IconButton(
                            iconSize: 30,
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              await controller.pickCategImage();
                            },
                          )
                          : Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  child: loadSvg(
                                    controller.categImage!.path,
                                    fit: BoxFit.cover,
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -20,
                                right: -20,
                                child: IconButton(
                                  onPressed: () {
                                    controller.pickCategImage();
                                  },
                                  icon: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: const Color.fromARGB(
                                      61,
                                      183,
                                      34,
                                      34,
                                    ),
                                    child: Icon(
                                      size: 17,
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                ),
          ),
          SizedBox(height: 30),
          TextFormAuth(
            label: "name in arabic",
            hint: "type category name in arabic",
            ctrl: controller.nameArCtrl,
            icon: Icon(Icons.abc),
            valid: (val) {
              return validate(val!, 3, 100, "name", controller);
            },
          ),
          SizedBox(height: 20),
          TextFormAuth(
            label: "name in english",
            hint: "type category name in english",
            ctrl: controller.nameEnCtrl,
            icon: Icon(Icons.abc),
            valid: (val) {
              return validate(val!, 3, 100, "name", controller);
            },
          ),
          SizedBox(height: 20),
          TextFormAuth(
            label: "name in deutsche",
            hint: "type category name in deutsche",
            ctrl: controller.nameDeCtrl,
            icon: Icon(Icons.abc),
            valid: (val) {
              return validate(val!, 3, 100, "name", controller);
            },
          ),
          SizedBox(height: 20),
          TextFormAuth(
            label: "name in spain",
            hint: "type category name in spain",
            ctrl: controller.nameSpCtrl,
            icon: Icon(Icons.abc),
            valid: (val) {
              return validate(val!, 3, 100, "name", controller);
            },
          ),

          SizedBox(height: 30),
          AuthButton(
            title: "Add",
            onPress: () {
              controller.addCategory();
            },
          ),
        ],
      ),
    );
  }
}
