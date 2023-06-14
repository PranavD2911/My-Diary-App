import 'package:get/get.dart';
class Locales extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en_US":{
      "change_username":"Change Username",
      "dairy":"My Dairy",
      "add":"Add"
    },
    "ru_RU":{
      "change_username":"Изменение имени пользователя",
      "dairy":"Моя молочная",
      "add":"Добавлять"
    },
    "sp_SP":{
      "change_username":"Cambie el nombre de usuario",
      "dairy":"Mi diario",
      "add":"Agregar"
    }


  };

}