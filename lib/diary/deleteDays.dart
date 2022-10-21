import 'package:shared_preferences/shared_preferences.dart';

import '../data/data.dart';

class DeleteDiaryDay{
 Future<bool> deleteDay(String key)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? days = pref.getStringList(StaticData.diaryDays);
    days?.removeWhere((day) => day == key);
    pref.remove(key);
    pref.setStringList(StaticData.diaryDays, days!);
    return true;
  }


}