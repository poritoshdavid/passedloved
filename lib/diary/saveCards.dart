import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/data.dart';

class SaveCards {
  saveCards(List cards) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? diaryDays = pref.getStringList(StaticData.diaryDays);
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    int day = DateTime.now().day;
    int now = DateTime(year, month, day).millisecondsSinceEpoch;
    List<String> days = [now.toString()];
    if (diaryDays != null) {
      if (!diaryDays.contains(now.toString())) {
        diaryDays.add(now.toString());
        pref.setStringList(StaticData.diaryDays, diaryDays);
      }
    } else {
      pref.setStringList(StaticData.diaryDays, days);
    }
    List<String> newCards = cards.map((e) => e.toString()).toList();

    String card = jsonEncode(newCards);
    List<String>? getDataOfDays = pref.getStringList(now.toString());
    if(getDataOfDays != null){
      getDataOfDays.add(card);
      pref.setStringList(now.toString(),getDataOfDays);
    }else{
      pref.setStringList(now.toString(), [card]);
    }
    print("Saved");
    print(getDataOfDays);
  }
}
