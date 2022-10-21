import 'dart:async';
import 'dart:math';


import 'package:passedloved/data/data.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../showdata.dart';


class FourCard extends StatefulWidget {
  List indexValue = [];
   FourCard({Key? key,required this.indexValue}) : super(key: key);
  @override
  _FourCardState createState() => _FourCardState();
}

class _FourCardState extends State<FourCard> {
  bool showCard = false;

  //Lists of Data
  List? oneCard;
  List? twoCard;
  List? threeCard;
  List? fourCard;
  List list = [];

  //getListLength

  List? getIndexValue;

  //list Index Value
  int? flength;
  int slength = 0;
  int tlength = 0;
  int fflength = 0;

  @override
  void initState() {
    isDiary();
    super.initState();
  }

  isDiary() {
    if (widget.indexValue.isNotEmpty) {
      List<dynamic> dData = widget.indexValue.map((e) => int.parse(e)).toList();
      getIndexValue = dData;
      cardDataSet(dData);
    }
  }

  cardDataSet(List indexOfCards) {
    for(int i = 1; i <= indexOfCards.length; i++) {
      if(i ==1){
        oneCard = StaticData.data[indexOfCards[i - 1]];
      }else if(i == 2){
        twoCard = StaticData.data[indexOfCards[i - 1]];
      }else if(i == 3){
        threeCard = StaticData.data[indexOfCards[i - 1]];
      }else if(i == 4){
        fourCard = StaticData.data[indexOfCards[i - 1]];
      }
    }
    setState(() {
      showCard = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Responsible.height * 0.60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: Responsible.width*0.03,
                right: Responsible.width*0.03,
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if(SavedDiary.setDiary){
                      SavedDiary.setSave(false);
                    }
                    Navigator.of(context).pop();
                  });
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: Responsible.fontSize*1.5,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: Responsible.height*0.01),
                child: Text(
                  'Mental, Physical, Spiritual, Emotional',
                  softWrap: true,
                  maxLines: 4,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Responsible.fontSize * 1.8,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontFamily: "kawoszeh",
                    shadows: const <Shadow>[
                      Shadow(
                        color: Colors.black,
                        offset: Offset(1.8, 1.5),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: Responsible.height * 0.5,
                    margin: EdgeInsets.only(top: height * 0.04),
                    child: CarouselSlider.builder(
                      itemCount: StaticData.data.length,
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        pageSnapping: false,
                        height: Responsible.height * 0.6,
                        viewportFraction: 0.62,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (ctx, index, intD) {
                        return InkWell(
                          onTap: () {
                            if (flength == null) {
                              flength = getValue();
                              setState(() {
                                oneCard = StaticData.data[getIndexValue![flength! - 1]];
                              });
                            } else if (flength! > slength) {
                              for (var i = 0; slength <= flength!; i++) {
                                setState(() {
                                  slength = getValue();
                                });
                              }
                              setState(
                                () {
                                  twoCard = StaticData.data[getIndexValue![slength - 1]];
                                },
                              );
                            } else if (slength > tlength) {
                              for (var i = 0; tlength <= slength; i++) {
                                setState(() {
                                  tlength = getValue();
                                });
                              }
                              setState(() {
                                threeCard = StaticData.data[getIndexValue![tlength - 1]];
                              });
                            } else if (tlength > fflength) {
                              for (var i = 0; fflength <= tlength; i++) {
                                setState(() {
                                  fflength = getValue();
                                });
                              }
                              setState(() {
                                fourCard = StaticData.data[getIndexValue![fflength - 1]];
                              });
                              Timer(const Duration(seconds: 1), () {
                                setState(() {
                                  showCard = true;
                                });
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(StaticData.cardImage),
                              fit: BoxFit.contain,
                            )),
                          ),
                        );
                      },
                    ),
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                oneCard != null
                                    ? InkWell(
                                        onTap: () {
                                          showCard != false
                                              ? setState(
                                                  () {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: oneCard,
                                                        titleData:
                                                        StaticData.fourCardSpread[0]
                                                                [0],
                                                            cardsIndex: getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                  },
                                                )
                                              // ignore: unnecessary_statements
                                              : null;
                                        },
                                        child: cards(context, height, width,
                                            oneCard![0]),
                                      )
                                    : sampleContent(context, height, width),
                                SizedBox(width: Responsible.width*0.045),
                                twoCard != null
                                    ? InkWell(
                                        onTap: () {
                                          showCard != false
                                              ? setState(
                                                  () {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: twoCard,
                                                        titleData:
                                                        StaticData.fourCardSpread[1]
                                                                [0],
                                                            cardsIndex: getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                  },
                                                )
                                              // ignore: unnecessary_statements
                                              : null;
                                        },
                                        child: cards(context, height, width,
                                            twoCard![0]),
                                      )
                                    : sampleContent(context, height, width),
                              ],
                            ),
                            SizedBox(height:Responsible.height*0.015),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                threeCard != null
                                    ? InkWell(
                                        onTap: () {
                                          showCard != false
                                              ? setState(() {
                                                  Route route =
                                                      MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        ShowData(
                                                      data: threeCard,
                                                      titleData:
                                                      StaticData.fourCardSpread[2][0],
                                                          cardsIndex: getIndexValue!,
                                                    ),
                                                  );
                                                  Navigator.push(
                                                      context, route);
                                                })
                                              // ignore: unnecessary_statements
                                              : null;
                                        },
                                        child: cards(context, height, width,
                                            threeCard![0]),
                                      )
                                    : sampleContent(context, height, width),
                                 SizedBox(width: Responsible.width*0.045),
                                fourCard != null
                                    ? InkWell(
                                        onTap: () {
                                          showCard != false
                                              ? setState(() {
                                                  Route route =
                                                      MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        ShowData(
                                                      data: fourCard,
                                                      titleData:
                                                      StaticData.fourCardSpread[3][0],
                                                          cardsIndex: getIndexValue!,
                                                    ),
                                                  );
                                                  Navigator.push(
                                                      context, route);
                                                })
                                              // ignore: unnecessary_statements
                                              : null;
                                        },
                                        child: cards(context, height, width,
                                            fourCard![0]),
                                      )
                                    : sampleContent(context, height, width),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cards(
      BuildContext context, double height, double width, var cardImage) {
    return SizedBox(
      height: Responsible.width * 0.18,
      width: Responsible.width * .12,
      child: Image(
        image: showCard != false
            ? AssetImage(
                cardImage,
              )
            :  AssetImage(
                StaticData.cardImage,
              ),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget sampleContent(BuildContext context, double height, double width) {
    return SizedBox(
      height: Responsible.width * 0.18,
      width: Responsible.width * 0.12,
      child: Image(
        image: AssetImage(StaticData.frameImage),
        fit: BoxFit.fill,
      ),
    );
  }

  getValue() {
    list.add(Random().nextInt(StaticData.data.length-1));
    getIndexValue = list.toSet().toList();
    int initialValue = getIndexValue!.length;
    return initialValue;
  }
}
