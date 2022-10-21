import 'dart:async';
import 'dart:math';

import 'package:passedloved/data/data.dart';
import 'package:passedloved/widgets/appbar.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../showdata.dart';

class TwoCard extends StatefulWidget {
  List indexValue = [];

  TwoCard({Key? key, required this.indexValue}) : super(key: key);

  @override
  _TwoCardState createState() => _TwoCardState();
}

class _TwoCardState extends State<TwoCard> {
  final globalKEy = GlobalKey<ScaffoldState>();
  bool showCard = false;

  //Lists of Data
  List? oneCard;
  List? twoCard;
  List list = [];

  //getListLength

  List? getIndexValue;

  //list Index Value
  int? flength;
  int? slength = 0;

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
        key: globalKEy,
        extendBodyBehindAppBar: true,
        appBar: TitleBar().appBar('Love Spread ', context),
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: height * 0.01),
                    height: Responsible.height * 0.6,
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
                            if(showCard){
                              return;
                            }
                            if (flength == null) {
                              flength = getValue();
                              setState(() {
                                oneCard = StaticData
                                    .data[getIndexValue![flength! - 1]];
                              });
                            } else if (flength! > slength!) {
                              for (var i = 0; slength! <= flength!; i++) {
                                setState(() {
                                  slength = getValue();
                                });
                              }
                              setState(() {
                                twoCard = StaticData
                                    .data[getIndexValue![slength! - 1]];
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            oneCard != null
                                ? InkWell(
                                    onTap: () {
                                      showCard != false
                                          ? setState(
                                              () {
                                                Route route = MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          ShowData(
                                                    data: oneCard,
                                                    cardsIndex: getIndexValue!,
                                                  ),
                                                );
                                                Navigator.push(context, route);
                                              },
                                            )
                                          // ignore: unnecessary_statements
                                          : null;
                                    },
                                    child: cards(
                                        context, height, width, oneCard![0]),
                                  )
                                : sampleContent(context, height, width),
                            const SizedBox(width: 15.0),
                            twoCard != null
                                ? InkWell(
                                    onTap: () {
                                      showCard != false
                                          ? setState(() {
                                              Route route = MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        ShowData(
                                                  data: twoCard,
                                                  cardsIndex: getIndexValue!,
                                                ),
                                              );
                                              Navigator.push(context, route);
                                            })
                                          // ignore: unnecessary_statements
                                          : null;
                                    },
                                    child: cards(
                                        context, height, width, twoCard![0]),
                                  )
                                : sampleContent(context, height, width),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget cards(
      BuildContext context, double height, double width, var cardImage) {
    return Container(
      height: Responsible.width * 0.24,
      width: Responsible.width * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: showCard != false
              ? AssetImage(
                  cardImage,
                )
              : AssetImage(
                  StaticData.cardImage,
                ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget sampleContent(BuildContext context, double height, double width) {
    return SizedBox(
      height: Responsible.width * 0.24,
      width: Responsible.width * 0.15,
      child: Image(
        image: AssetImage(StaticData.frameImage),
        fit: BoxFit.fill,
      ),
    );
  }

  getValue() {
    list.add(Random().nextInt(StaticData.data.length - 1));
    getIndexValue = list.toSet().toList();
    int initialValue = getIndexValue!.length;
    return initialValue;
  }
}
