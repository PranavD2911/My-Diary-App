import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/diary_entry_controller.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final DiaryController _diaryController=Get.find(tag: "diary_controller");

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(()=> _diaryController.dairyEntries.isEmpty? const Text("Whats,up..."):
        ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_diaryController.dairyEntries[index].dateString,style: Get.textTheme.headlineSmall,),
                          const SizedBox(height: 10,),
                          Text(_diaryController.dairyEntries[index].Content,style: Get.textTheme.headlineSmall,),
                        ],
                        ),
                    ),
                    IconButton(onPressed: (){
                      showDialog(context: context, builder: (context)=> AlertDialog(
                        title: const Text("Are you sure!"),
                        content: const Text("You want to delete it.."),
                        actions: [
                          Center(
                            child: Row(
                              children: [
                                ElevatedButton(onPressed: (){
                                  _diaryController.deleteDairyEntry(index);
                                  Get.back();
                                }, child: Text("Yes")),
                                const SizedBox(width: 20,),
                                ElevatedButton(onPressed: (){
                                  Get.back();
                                }, child: Text("No")),
                              ],
                            ),
                          )
                        ],
                      ));
                      // _diaryController.deletediaryEntry(index);
                    }, icon: Icon(Icons.delete,size: 20,color: Colors.red,))
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
                  height: 5,
                ),
            itemCount: _diaryController.dairyEntries.length),
      ),
    );
  }
}
