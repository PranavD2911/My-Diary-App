import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/user_controller.dart';

class ChangeUsername extends StatefulWidget {
  const ChangeUsername({Key? key}) : super(key: key);

  @override
  State<ChangeUsername> createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {
  final UserController _userController = Get.find(tag: "user_controller");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(hintText: "Enter Username"),
            onChanged: (value) {
              if (value != "") {
                _userController.changeUsername(value);
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("change_username".tr)),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Back".tr))
        ],
      ),
    ));
  }
}
