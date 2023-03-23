
import 'package:passedloved/about/about_author.dart';
import 'package:passedloved/data/data.dart';
import 'package:passedloved/diary/diary.dart';
import 'package:passedloved/guidbook/guidebook.dart';
import 'package:passedloved/reading/cards.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/textStyles.dart';

class passedloved extends StatefulWidget {
  const passedloved({Key? key}) : super(key: key);

  @override
  _passedlovedState createState() => _passedlovedState();
}

class _passedlovedState extends State<passedloved> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(StaticData.backgroundImage),
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
                scale: 1.0,
              ),
            ),
            child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Spacer(flex: 1,),
                    Container(
                      margin: EdgeInsets.only(top: Responsible.height * 0.01),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: Responsible.width*0.02),
                      child: FittedBox(
                        child: Text(
                          StaticData.firstT,
                          style: TextStyles().headingStyle(),
                        ),
                      ),
                    ),
                   Container(
                      margin: EdgeInsets.only(top: Responsible.height * 0.01),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: Responsible.width*0.2),
                      child: FittedBox(
                        child: Text(
                          StaticData.secondT,
                          style: TextStyles().headingStyle(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(
                          StaticData.appSubTitleOne,
                          textAlign: TextAlign.center,
                          style:TextStyles().subStyle(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FittedBox(child: Text(
                        StaticData.appSubTitleTwo,
                        textAlign: TextAlign.center,
                        style:TextStyles().subStyle(),
                      ),),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: FittedBox(child:Text(
                        StaticData.authorName,
                        textAlign: TextAlign.center,
                        style:TextStyles().subStyle(),
                      ),),
                    ),
                   const Spacer(flex: 8,),
                    SizedBox(
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin:
                                 EdgeInsets.symmetric(horizontal: Responsible.width*0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Route route = MaterialPageRoute(
                                        builder: (context) =>
                                            const GuideBook());
                                    Navigator.push(context, route);
                                  },
                                  child: SizedBox(
                                    width: Responsible.width * .35,
                                    child: Image(
                                      image: AssetImage(
                                          StaticData.guidebookButton),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Responsible.width * 0.1,
                                ),
                                InkWell(
                                  onTap: () {
                                    Route route = MaterialPageRoute(
                                        builder: (context) => const AboutKim());
                                    Navigator.push(context, route);
                                  },
                                  child: SizedBox(
                                    width: Responsible.width * .35,
                                    child: Image(
                                      image:
                                          AssetImage(StaticData.aboutButton),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                           SizedBox(
                            height: Responsible.height*0.01,
                          ),
                          Container(
                            margin:
                                 EdgeInsets.symmetric(horizontal: Responsible.width*0.06),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Route route = MaterialPageRoute(
                                        builder: (c) => const ReadingDesc());
                                    Navigator.push(context, route);
                                  },
                                  child: SizedBox(
                                    width: Responsible.width * .35,
                                    child:  Image(
                                      image: AssetImage(
                                          StaticData.readButton),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Responsible.width * 0.1,
                                ),
                                InkWell(
                                  onTap: () {
                                    Route route = MaterialPageRoute(
                                        builder: (c) => const Diary());
                                    Navigator.push(context, route);
                                  },
                                  child: SizedBox(
                                    width: Responsible.width * .35,
                                    child: Image(
                                      image: AssetImage(
                                         StaticData.diaryButton),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: SizeConfig.width * 0.2,
                          // ),
                        ],
                      ),
                    ),
                   const Spacer(flex: 1,),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
