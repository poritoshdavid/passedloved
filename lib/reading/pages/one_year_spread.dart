import 'dart:async';
import 'dart:math';

import 'package:passedloved/data/data.dart';
import 'package:passedloved/widgets/appbar.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../showdata.dart';

class OneYearSpread extends StatefulWidget {
  List indexValue = [];

  OneYearSpread({Key? key, required this.indexValue}) : super(key: key);

  @override
  _OneYearSpreadState createState() => _OneYearSpreadState();
}

class _OneYearSpreadState extends State<OneYearSpread> {
  bool showCard = false;

  //Lists of Data
  List? oneCard;
  List? twoCard;
  List? threeCard;
  List? fourCard;
  List? fivCard;
  List? sixCard;
  List? sevenCard;
  List? eightCard;
  List? nineCard;
  List? tenCard;
  List? elevenCard;
  List? twelveCard;
  List list = [];

  //getListLength

  List? getIndexValue;

  //list Index Value
  int? flength;
  int slength = 0;
  int tlength = 0;
  int forlength = 0;
  int fivlength = 0;
  int sixlength = 0;
  int sevenlength = 0;
  int eightlength = 0;
  int ninelength = 0;
  int tenlength = 0;
  int elevenlength = 0;
  int twelvelength = 0;

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
    for (int i = 1; i <= indexOfCards.length; i++) {
      if (i == 1) {
        oneCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 2) {
        twoCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 3) {
        threeCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 4) {
        fourCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 5) {
        fivCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 6) {
        sixCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 7) {
        sevenCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 8) {
        eightCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 9) {
        nineCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 10) {
        tenCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 11) {
        elevenCard = StaticData.data[indexOfCards[i - 1]];
      } else if (i == 12) {
        twelveCard = StaticData.data[indexOfCards[i - 1]];
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
        appBar: TitleBar().appBar('One Year Spread ', context),
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
                    SizedBox(
                      height: Responsible.height * 0.55,
                      child: CarouselSlider.builder(
                        itemCount: StaticData.data.length,
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          pageSnapping: false,
                          height: Responsible.height * 0.55,
                          viewportFraction: 0.62,
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (ctx, index, intD) {
                          return InkWell(
                            onTap: () {
                              if (flength == null) {
                                flength = getValue();
                                setState(() {
                                  oneCard = StaticData
                                      .data[getIndexValue![flength! - 1]];
                                });
                              } else if (flength! > slength) {
                                for (var i = 0; slength <= flength!; i++) {
                                  setState(() {
                                    slength = getValue();
                                  });
                                }
                                setState(() {
                                  twoCard = StaticData
                                      .data[getIndexValue![slength - 1]];
                                });
                              } else if (slength > tlength) {
                                for (var i = 0; tlength <= slength; i++) {
                                  setState(() {
                                    tlength = getValue();
                                  });
                                }
                                setState(() {
                                  threeCard = StaticData
                                      .data[getIndexValue![tlength - 1]];
                                });
                              } else if (tlength > forlength) {
                                for (var i = 0; forlength <= tlength; i++) {
                                  setState(() {
                                    forlength = getValue();
                                  });
                                }
                                setState(() {
                                  fourCard = StaticData
                                      .data[getIndexValue![forlength - 1]];
                                });
                              } else if (forlength > fivlength) {
                                for (var i = 0; fivlength <= forlength; i++) {
                                  setState(() {
                                    fivlength = getValue();
                                  });
                                }
                                setState(() {
                                  fivCard = StaticData
                                      .data[getIndexValue![fivlength - 1]];
                                });
                              } else if (fivlength > sixlength) {
                                for (var i = 0; sixlength <= fivlength; i++) {
                                  setState(() {
                                    sixlength = getValue();
                                  });
                                }
                                setState(() {
                                  sixCard = StaticData
                                      .data[getIndexValue![sixlength - 1]];
                                });
                              } else if (sixlength > sevenlength) {
                                for (var i = 0; sevenlength <= sixlength; i++) {
                                  setState(() {
                                    sevenlength = getValue();
                                  });
                                }
                                setState(() {
                                  sevenCard = StaticData
                                      .data[getIndexValue![sevenlength - 1]];
                                });
                              } else if (sevenlength > eightlength) {
                                for (var i = 0;
                                    eightlength <= sevenlength;
                                    i++) {
                                  setState(() {
                                    eightlength = getValue();
                                  });
                                }
                                setState(() {
                                  eightCard = StaticData
                                      .data[getIndexValue![eightlength - 1]];
                                });
                              } else if (eightlength > ninelength) {
                                for (var i = 0;
                                    ninelength <= eightlength;
                                    i++) {
                                  setState(() {
                                    ninelength = getValue();
                                  });
                                }
                                setState(() {
                                  nineCard = StaticData
                                      .data[getIndexValue![ninelength - 1]];
                                });
                              } else if (ninelength > tenlength) {
                                for (var i = 0; tenlength <= ninelength; i++) {
                                  setState(() {
                                    tenlength = getValue();
                                  });
                                }
                                setState(() {
                                  tenCard = StaticData
                                      .data[getIndexValue![tenlength - 1]];
                                });
                              } else if (tenlength > elevenlength) {
                                for (var i = 0;
                                    elevenlength <= tenlength;
                                    i++) {
                                  setState(() {
                                    elevenlength = getValue();
                                  });
                                }
                                setState(() {
                                  elevenCard = StaticData
                                      .data[getIndexValue![elevenlength - 1]];
                                });
                              } else if (elevenlength > twelvelength) {
                                for (var i = 0;
                                    twelvelength <= elevenlength;
                                    i++) {
                                  setState(() {
                                    twelvelength = getValue();
                                  });
                                }
                                setState(() {
                                  twelveCard = StaticData
                                      .data[getIndexValue![twelvelength - 1]];
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
                                                          cardsIndex:
                                                              getIndexValue!,
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
                                  SizedBox(width: Responsible.width * 0.02),
                                  twoCard != null
                                      ? InkWell(
                                          onTap: () {
                                            showCard != false
                                                ? setState(() {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: twoCard,
                                                        cardsIndex:
                                                            getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                    // ignore: unnecessary_statements
                                                  })
                                                // ignore: unnecessary_statements
                                                : null;
                                          },
                                          child: cards(context, height, width,
                                              twoCard![0]),
                                        )
                                      : sampleContent(context, height, width),
                                  SizedBox(width: Responsible.width * 0.02),
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
                                                        cardsIndex:
                                                            getIndexValue!,
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
                                  SizedBox(width: Responsible.width * 0.02),
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
                                                        cardsIndex:
                                                            getIndexValue!,
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
                              SizedBox(height: Responsible.height * 0.01),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  fivCard != null
                                      ? InkWell(
                                          onTap: () {
                                            showCard != false
                                                ? setState(() {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: fivCard,
                                                        cardsIndex:
                                                            getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                  })
                                                // ignore: unnecessary_statements
                                                : null;
                                          },
                                          child: cards(context, height, width,
                                              fivCard![0]),
                                        )
                                      : sampleContent(context, height, width),
                                  SizedBox(width: Responsible.width * 0.02),
                                  sixCard != null
                                      ? InkWell(
                                          onTap: () {
                                            showCard != false
                                                ? setState(() {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: sixCard,
                                                        cardsIndex:
                                                            getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                  })
                                                // ignore: unnecessary_statements
                                                : null;
                                          },
                                          child: cards(context, height, width,
                                              sixCard![0]),
                                        )
                                      : sampleContent(context, height, width),
                                  SizedBox(width: Responsible.width * 0.02),
                                  sevenCard != null
                                      ? InkWell(
                                          onTap: () {
                                            showCard != false
                                                ? setState(() {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: sevenCard,
                                                        cardsIndex:
                                                            getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                  })
                                                // ignore: unnecessary_statements
                                                : null;
                                          },
                                          child: cards(context, height, width,
                                              sevenCard![0]),
                                        )
                                      : sampleContent(context, height, width),
                                  SizedBox(width: Responsible.width * 0.02),
                                  eightCard != null
                                      ? InkWell(
                                          onTap: () {
                                            showCard != false
                                                ? setState(() {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: eightCard,
                                                        cardsIndex:
                                                            getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                  })
                                                // ignore: unnecessary_statements
                                                : null;
                                          },
                                          child: cards(context, height, width,
                                              eightCard![0]),
                                        )
                                      : sampleContent(context, height, width),
                                ],
                              ),
                              SizedBox(height: Responsible.height * 0.01),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  nineCard != null
                                      ? InkWell(
                                          onTap: () {
                                            showCard != false
                                                ? setState(() {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: nineCard,
                                                        cardsIndex:
                                                            getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                  })
                                                // ignore: unnecessary_statements
                                                : null;
                                          },
                                          child: cards(context, height, width,
                                              nineCard![0]),
                                        )
                                      : sampleContent(context, height, width),
                                  SizedBox(width: Responsible.width * 0.02),
                                  tenCard != null
                                      ? InkWell(
                                          onTap: () {
                                            showCard != false
                                                ? setState(() {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: tenCard,
                                                        cardsIndex:
                                                            getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                  })
                                                // ignore: unnecessary_statements
                                                : null;
                                          },
                                          child: cards(context, height, width,
                                              tenCard![0]),
                                        )
                                      : sampleContent(context, height, width),
                                  SizedBox(width: Responsible.width * 0.02),
                                  elevenCard != null
                                      ? InkWell(
                                          onTap: () {
                                            showCard != false
                                                ? setState(() {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: elevenCard,
                                                        cardsIndex:
                                                            getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                  })
                                                // ignore: unnecessary_statements
                                                : null;
                                          },
                                          child: cards(context, height, width,
                                              elevenCard![0]),
                                        )
                                      : sampleContent(context, height, width),
                                  SizedBox(width: Responsible.width * 0.02),
                                  twelveCard != null
                                      ? InkWell(
                                          onTap: () {
                                            showCard != false
                                                ? setState(() {
                                                    Route route =
                                                        MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ShowData(
                                                        data: twelveCard,
                                                        cardsIndex:
                                                            getIndexValue!,
                                                      ),
                                                    );
                                                    Navigator.push(
                                                        context, route);
                                                  })
                                                // ignore: unnecessary_statements
                                                : null;
                                          },
                                          child: cards(context, height, width,
                                              twelveCard![0]),
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
        ));
  }

  Widget cards(
      BuildContext context, double height, double width, var cardImage) {
    return SizedBox(
      height: Responsible.width * 0.15,
      width: Responsible.width * .10,
      child: Image(
        image: showCard != false
            ? AssetImage(
                cardImage,
              )
            : AssetImage(
                StaticData.cardImage,
              ),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget sampleContent(BuildContext context, double height, double width) {
    return SizedBox(
      height: Responsible.width * 0.15,
      width: Responsible.width * .10,
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
