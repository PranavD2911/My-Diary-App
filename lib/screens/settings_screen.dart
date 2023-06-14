import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';
import 'change_username.dart';
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final UserController _userController= Get.put(UserController(), tag: "user_controller");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(()=> Text(_userController.username, style: Get.textTheme.headlineSmall,)),
        // Text("username".tr, style: TextStyle(color: Colors.purpleAccent,fontSize: 30), ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              Get.updateLocale(const Locale("en_US"));
            }, child: Text("ENGLSIH")),
            ElevatedButton(onPressed: (){
              Get.updateLocale(const Locale("ru_RU"));
            }, child: Text("RUSSIAN")),
            ElevatedButton(onPressed: (){
              Get.updateLocale(const Locale("sp_SP"));
            }, child: Text("SPANISH")),
          ],
        ),
        const SizedBox(height: 10,),
        ElevatedButton(onPressed: (){
          Get.to(ChangeUsername());
        }, child: Text("change_username".tr))
      ],
    );
  }
}
