import 'dart:convert';

import 'package:passedloved/reading/pages/one_card.dart';
import 'package:passedloved/reading/pages/one_year_spread.dart';
import 'package:passedloved/reading/pages/past_life_spread.dart';
import 'package:passedloved/widgets/routes.dart';
import 'package:passedloved/widgets/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data.dart';
import '../reading/pages/four_card.dart';
import '../reading/pages/three_card.dart';
import '../reading/pages/two_card.dart';
import '../widgets/appbar.dart';
import '../widgets/responsible.dart';

import 'deleteDays.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  State<Diary> createState() => _DiaryState();
}

enum Processing { Fetching, Loaded, Empty }

class _DiaryState extends State<Diary> {
  List<String>? diaryDays = [];
  List<List<dynamic>> dayByDays = [];
  List<String> dateDays = [];
  Processing processing = Processing.Fetching;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    diaryDays = pref.getStringList(StaticData.diaryDays);
    if (diaryDays == null || diaryDays!.isEmpty) {
        setState(() {
          processing = Processing.Empty;
       });
      return;
    }
    for (int i = diaryDays!.length - 1; i >= 0; i--) {
      List<String>? dayData = pref.getStringList(diaryDays![i]);
      List dayOfCards = [];
      if (dayData == null || dayData.isEmpty) {
        setState(() {
          processing = Processing.Empty;
        });
        return;
      }
      for (int j = dayData.length - 1; j >= 0; j--) {
        List<dynamic> trans = jsonDecode(dayData[j]);
        dayOfCards.add(trans);
        if (j == dayData.length - 1) {
          dayByDays.add(dayOfCards);
          dateDays.add(diaryDays![i]);
        }
      }
      if (i == diaryDays!.length - 1) {
        setState(() {
          processing = Processing.Loaded;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar().DBar("Diary", context),
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: Responsible.height,
        width: Responsible.width,
        padding: EdgeInsets.symmetric(horizontal: Responsible.width * 0.05),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(StaticData.backgroundImage),
                fit: BoxFit.cover)),
        child: processing == Processing.Loaded
            ? ListView.builder(
                physics: const ScrollPhysics(),
                itemCount: dayByDays.length,
                itemBuilder: (c, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            days(dateDays[index]),
                            style: TextStyles().mediumTitle(),
                          ),
                          SizedBox(
                            width: Responsible.width * 0.1,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: Responsible.fontSize * 1.5,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              deleteDays(dateDays[index]);
                            },
                          ),
                        ],
                      ),
                      ListView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: dayByDays[index].length,
                          itemBuilder: (c, ind) {
                            return Container(
                              height: Responsible.height * 0.262,
                              width: Responsible.width * 0.7,
                              padding: EdgeInsets.symmetric(
                                  vertical: Responsible.height * 0.01),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: dayByDays[index][ind].length,
                                  itemBuilder: (c, idt) {
                                    int desk =
                                        int.parse(dayByDays[index][ind][idt]);
                                    return InkWell(
                                      onTap: (){
                                        if(!SavedDiary.setDiary){
                                          SavedDiary.setSave(true);
                                        }
                                        if(dayByDays[index][ind].length == 1){
                                          Routes(context: context).routePush(OneCard(indexValue:dayByDays[index][ind],));
                                        }else if(dayByDays[index][ind].length == 2){
                                          Routes(context: context).routePush(TwoCard(indexValue: dayByDays[index][ind],));
                                        }else if(dayByDays[index][ind].length == 3){
                                          Routes(context: context).routePush(ThreeCard(indexValue: dayByDays[index][ind],));
                                        }else if(dayByDays[index][ind].length == 4){
                                          Routes(context: context).routePush(FourCard(indexValue: dayByDays[index][ind],));
                                        }else if(dayByDays[index][ind].length == 9){
                                          Routes(context: context).routePush(PastLifeSpread(indexValue: dayByDays[index][ind],));
                                        }else if(dayByDays[index][ind].length == 12){
                                          Routes(context: context).routePush(OneYearSpread(indexValue: dayByDays[index][ind],));
                                        }
                                      },
                                      child: Container(
                                          height: Responsible.height * 0.262,
                                          width: Responsible.height * 0.17,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(StaticData
                                                      .data[desk][0])))),
                                    );
                                  }),
                            );
                          }),
                    ],
                  );
                })
            : processing == Processing.Fetching
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Center(
                    child: Text(
                      "Diary is Empty",
                      style: TextStyles().normalReading(),
                    ),
                  ),
      ),
    );
  }

  void deleteDays(String key) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (c) {
          return AlertDialog(
            title: Text(
              "Are you sure you want to delete this day?",
              style: TextStyles().basicReading(),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyles().normalTitle(),
                  )),
              ElevatedButton(
                  onPressed: () async {
                    bool isDel = await DeleteDiaryDay().deleteDay(key);
                    if (isDel) {
                      setState(() {
                        Routes(context: context).routeReplace(const Diary());
                      });
                    }
                  },
                  child: Text(
                    "OK",
                    style: TextStyles().normalTitle(),
                  )),
            ],
          );
        });
  }

  days(String timesStamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timesStamp));
    String days =
        "${dateTime.day} ${StaticData.months[dateTime.month]} ${dateTime.year}";
    return days;
  }
}
