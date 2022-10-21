import 'dart:math';

import 'package:passedloved/data/data.dart';
import 'package:passedloved/widgets/appbar.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../showdata.dart';

class OneCard extends StatefulWidget {
  List indexValue = [];
   OneCard({Key? key,required this.indexValue}) : super(key: key);
  @override
  _OneCardState createState() => _OneCardState();
}

class _OneCardState extends State<OneCard> {
  List? getData;
  int? oneCard;

  @override
  void initState() {
    if(widget.indexValue.isNotEmpty){
      getData = StaticData.data[int.parse(widget.indexValue[0])];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TitleBar().appBar('One-Card Spread', context),
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
                          int max = StaticData.data.length-1;
                          int indexValue = Random().nextInt(max);
                          oneCard = indexValue;
                          if (getData != null) {
                            return;
                          } else {
                            setState(() {
                              getData = StaticData.data[indexValue];
                            });
                          }
                        },
                        child: Container(
                          decoration:  BoxDecoration(
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
                      child: Center(
                        child: getData != null
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    Route route = MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ShowData(data: getData, cardsIndex:[oneCard] ,),
                                    );
                                    Navigator.push(context, route);
                                  });
                                },
                                child: Container(
                                  height: Responsible.width * 0.22,
                                  width: Responsible.width * 0.14,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        getData![0],
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: Responsible.width * 0.22,
                                width: Responsible.width
                                    * 0.14,
                                child: Image(
                                  image: AssetImage(StaticData.frameImage),
                                  fit: BoxFit.fill,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
