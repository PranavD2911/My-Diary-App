import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_dairy_app/models/dairy_entry_model.dart';

class DiaryController extends GetxController
{
  final GetStorage _getStorage=GetStorage();
  List<DairyEntries> get dairyEntries=>[..._dairyEntries].toList(); //this is not observable

  final RxList<DairyEntries> _dairyEntries=<DairyEntries>[].obs;

  String _entryText="";

  @override
  void onInit() {
    final List<dynamic> list=_getStorage.read("dairy_entries") ?? [];

    List<DairyEntries> data=[];

    for(var element in list)
      {
        final String date=element["dateTime"];
        final String content=element["content"];

        data.add(DairyEntries(dateString: date, Content: content));
      }

    _dairyEntries.value=data;

    super.onInit();
  }
  void changeEntryText(String text)
  {
    _entryText=text;
  }

  void addDairyEntry()
  {
    // initializeDateFormatting();

    if(_entryText != "")
      {
        DateFormat format=DateFormat.yMMMMEEEEd(Get.locale.toString());
        String dateString=format.format(DateTime.now());

        _dairyEntries.add(DairyEntries(dateString: dateString, Content: _entryText));

        List data=[];
        for(DairyEntries dairyEntries in _dairyEntries)
          {
            data.add({
              "dateTime":dairyEntries.dateString,
              "content":dairyEntries.Content,
            });
          }
        _getStorage.write("dairy_entries", data);
      }
    //reset entry text
    _entryText="";
  }

  void deleteDairyEntry(int index)
  {
    _dairyEntries.removeAt(index);
    List data=[];
    for(DairyEntries dairyEntries in _dairyEntries)
    {
      data.add({
        "dateTime":dairyEntries.dateString,
        "content":dairyEntries.Content,
      });
    }
    _getStorage.write("dairy_entries", data);
  }


}