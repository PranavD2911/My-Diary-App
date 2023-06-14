import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dairy_app/controller/diary_entry_controller.dart';
import 'package:my_dairy_app/screens/home_screen.dart';
import 'package:my_dairy_app/screens/settings_screen.dart';

class DairyTabBarView extends StatefulWidget {
  const DairyTabBarView({Key? key}) : super(key: key);

  @override
  State<DairyTabBarView> createState() => _DairyTabBarViewState();
}

class _DairyTabBarViewState extends State<DairyTabBarView> {
  final DiaryController _diaryController=Get.put(DiaryController(),tag: "diary_controller");

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Diary".tr,style: TextStyle(fontSize: 25,color: Colors.purple,fontWeight: FontWeight.bold)),
            actions: [
              IconButton(onPressed: (){
                Get.bottomSheet(BottomSheet(
                    onClosing: (){}, builder: (context){
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(height: 20,),
                            TextField(decoration: const InputDecoration(hintText:"Enter note",),
                              onChanged: (value){
                              _diaryController.changeEntryText(value);
                            },),
                            const SizedBox(height: 20,),
                            ElevatedButton(onPressed: (){

                              _diaryController.addDairyEntry();
                              Get.back();

                            }, child: Text("add".tr)),
                            ElevatedButton(onPressed: (){

                              Get.back();

                            }, child: Text("Back".tr)),
                          ],
                        ),
                      );
                }
                ));
              }, icon: Icon(Icons.add,size: 30,color:Colors.purple.shade800,))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.event_note)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: TabBarView(children: [
            HomeScreen(),
            SettingsScreen(),
          ]),
        ));
  }
}
