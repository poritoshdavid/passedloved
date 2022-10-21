import 'package:passedloved/data/data.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:passedloved/widgets/routes.dart';

import '../widgets/textStyles.dart';
import 'pages/four_card.dart';
import 'pages/one_card.dart';
import 'pages/one_year_spread.dart';
import 'pages/past_life_spread.dart';
import 'pages/three_card.dart';
import 'pages/two_card.dart';
import 'package:flutter/material.dart';

class ReadingDesc extends StatefulWidget {
  const ReadingDesc({Key? key}) : super(key: key);
  @override
  _ReadingDescState createState() => _ReadingDescState();
}

class _ReadingDescState extends State<ReadingDesc> {
  @override
  void initState() {
    if(SavedDiary.setDiary){
      SavedDiary.setSave(false);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Responsible.height * 0.60),
        child: Container(
          padding: EdgeInsets.only(right:Responsible.width*0.03),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
           children: [
              Container(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  icon:Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: Responsible.fontSize*1.5,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal:Responsible.width*0.1),
                  child: FittedBox(
                    child: Text(
                      StaticData.firstT,
                      style:TextStyles().normalTitle(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(StaticData.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Responsible.height * 0.02,
                    vertical: Responsible.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                         Routes(context: context).routePush(OneCard(indexValue: const [],));
                        });
                      },
                      child: Container(
                        height: Responsible.height * 0.24,
                        width: Responsible.width * 0.40,
                        decoration: decoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                height: Responsible.boxHeight,
                                width: Responsible.boxWidth*1.2,
                                margin: EdgeInsets.only(
                                    top: Responsible.height * 0.04),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    width: 2.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Responsible.width*0.04
                                ),
                                alignment: Alignment.center,
                                child: FittedBox(child:Text(
                                  'One Card Spread',
                                  style: TextStyles().cardsTitle(),
                                ),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Routes(context: context).routePush(TwoCard(indexValue: const [],));
                        });
                      },
                      child: Container(
                        height: Responsible.height * 0.24,
                        width: Responsible.width * 0.40,
                        decoration:decoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    height: Responsible.boxHeight * 3.6,
                                    width: Responsible.boxWidth,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height:Responsible.boxHeight * 3.6,
                                    width: Responsible.boxWidth,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Responsible.width*0.04
                                ),
                                alignment: Alignment.center,
                                child: FittedBox(
                                  child: Text(
                                    'Love Spread',
                                    style: TextStyles().cardsTitle(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsible.height * 0.02,
                  vertical: Responsible.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          Route route = MaterialPageRoute(
                              builder: (c) => ThreeCard(indexValue: const [],));
                          Navigator.push(context, route);
                        });
                      },
                      child: Container(
                        height: Responsible.height * 0.24,
                        width: Responsible.width * 0.40,
                        decoration: decoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    height: Responsible.boxHeight * 3,
                                    width: Responsible.boxWidth / 1.2,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Container(
                                    alignment: Alignment.center,
                                    height: Responsible.boxHeight * 3,
                                    width: Responsible.boxWidth / 1.2,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Container(
                                    alignment: Alignment.center,
                                    height: Responsible.boxHeight * 3,
                                    width: Responsible.boxWidth / 1.2,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Responsible.width*0.03
                              ),
                                child: Column(
                                  children: <Widget>[
                                    FittedBox(child:Text(
                                      'Three Card Spread',
                                      style: TextStyles().cardsTitle(),
                                    )),
                                    FittedBox(child:Text(
                                      '(Past, Now, Future)',
                                      style: TextStyles().cardsTitle(),
                                    )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                       Routes(context:context).routePush( PastLifeSpread(indexValue: const [],));
                      },
                      child: Container(
                        height: Responsible.height * 0.24,
                        width: Responsible.width * 0.40,
                        decoration: decoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(

                                clipBehavior: Clip.none,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Responsible.width*0.04
                                ),
                                alignment:Alignment.topCenter,
                                child: FittedBox(
                                  child: Text(
                                    'Past Life Spread',
                                    style: TextStyles().cardsTitle(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsible.height * 0.02,
                  vertical: Responsible.height * 0.02,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Routes(context: context).routePush(OneYearSpread(indexValue: const [],));
                      },
                      child: Container(
                        height: Responsible.height * 0.24,
                        width: Responsible.width * 0.40,
                        decoration: decoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.5,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                ],
                              ),
                            ),
                            Expanded(
                              flex:2,
                              child: Container(
                                clipBehavior: Clip.none,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Responsible.width*0.04
                                ),
                                alignment:Alignment.topCenter,
                                child: FittedBox(
                                  child: Text(
                                    'One Year Spread',
                                    style: TextStyles().cardsTitle(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Route route = MaterialPageRoute(
                              builder: (c) => FourCard(indexValue: const [],));
                          Navigator.push(context, route);
                        });
                      },
                      child: Container(
                        height: Responsible.height * 0.24,
                        width: Responsible.width * 0.40,
                        decoration: decoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.7,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.7,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.7,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8.0),
                                      Container(
                                        alignment: Alignment.center,
                                        height: Responsible.boxHeight * 1.7,
                                        width: Responsible.boxWidth / 2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            width: 2.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Responsible.width*0.04
                                    ),
                                    alignment:Alignment.topCenter,
                                    child: FittedBox(child:Text(
                                      'Mental, Physical,',
                                      textAlign: TextAlign.center,
                                      style: TextStyles().cardsTitle(),
                                    )),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Responsible.width*0.04
                                    ),
                                    alignment:Alignment.topCenter,
                                    child: FittedBox(
                                      child: Text(
                                        'Spiritual, Emotional',
                                        textAlign: TextAlign.center,
                                        style: TextStyles().cardsTitle(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
  BoxDecoration decoration(){
    return BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(Responsible.height*0.037),
      image: DecorationImage(
        image: AssetImage(StaticData.frameImage),
        fit: BoxFit.fill,
      ),
    );
  }
  
}
