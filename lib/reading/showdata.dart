import 'dart:typed_data';

import 'package:passedloved/data/data.dart';
import 'package:passedloved/diary/diary.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:passedloved/widgets/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image/image.dart' as img;

import '../diary/saveCards.dart';
import '../widgets/textStyles.dart';

class ShowData extends StatefulWidget {
  final String? titleData;
  final List cardsIndex;
  final List? data;

  const ShowData(
      {Key? key, this.data, this.titleData, required this.cardsIndex})
      : super(key: key);

  @override
  _ShowDataState createState() => _ShowDataState();
}

enum ShowReadData {
  show,
  read,
}

class _ShowDataState extends State<ShowData> {
  ShowReadData showReadData = ShowReadData.show;

  String? crystalTitleOne;
  String? crystalTitleTwo;
  String? crystalTitleThree;
  String? crystalTitleFour;
  String? crystalTitleFiv;
  String? crystalTitleSix;
  String? affirmation;
  String? chakras;
  String? otherUses;
  Color? getColors;

  bool isSaved = false;

  @override
  void initState() {
    isSaved = SavedDiary.setDiary;

    super.initState();
  }

  Future<Color> getColor(String coverData) async {
    img.Image? photo;
    Uint8List data;
    try {
      data = (await rootBundle.load(coverData)).buffer.asUint8List();
      List<int> values = data.buffer.asUint8List();
      photo = null;
      photo = img.decodeImage(values);
    } catch (ex) {
      print(ex.toString());
    }

    double px = 4.0;
    double py = 20.0;
    int pixel32 = photo!.getPixelSafe(px.toInt(), py.toInt());
    int hex = abgrToArgb(pixel32);

    getColors = Color(hex);
    return Color(hex);
  }

  int abgrToArgb(int argbColor) {
    int r = (argbColor >> 16) & 0xFF;
    int b = argbColor & 0xFF;
    return (argbColor & 0xFF00FF00) | (b << 16) | r;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      // appBar: appBarCards(widget.titleData.toString()),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: Responsible.width * 0.03,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(StaticData.backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                showReadData == ShowReadData.show
                    ? Container()
                    : Flexible(
                        flex: 6,
                        child: Container(
                          // color: Colors.blue,
                          margin:
                              EdgeInsets.only(top: Responsible.height * 0.04),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: widget.titleData,
                              style: TextStyle(
                                shadows: const <Shadow>[
                                  Shadow(
                                    offset: Offset(2.0, 3.0),
                                    blurRadius: 1.5,
                                    color: Colors.black,
                                  ),
                                ],
                                fontSize: Responsible.fontSize * 1.4,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                                fontFamily: 'kawoszeh',
                              ),
                            ),
                          ),
                        ),
                      ),
                Expanded(
                  flex: widget.titleData == null ? 22 : 18,
                  child: showReadData == ShowReadData.show
                      ? showCard(height)
                      : widget.titleData == null
                          ? readData(height, "")
                          : readData(height, widget.titleData),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: Container(
          // color: Colors.blue,
          margin:  EdgeInsets.only(top: Responsible.height*0.012),
          height: Responsible.height * 0.09,
          padding:  EdgeInsets.only(
            bottom: Responsible.height*0.01,
            right: Responsible.width*0.05,
            left: Responsible.width*0.05,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: Responsible.width*0.03,
                    right: Responsible.width*0.01,
                    top: Responsible.width*0.02,
                    bottom:  Responsible.width*0.02,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(Responsible.height*0.01)),
                  child:  Icon(
                    Icons.arrow_back_ios,
                    size: Responsible.fontSize*1.5,
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (showReadData == ShowReadData.show) {
                      showReadData = ShowReadData.read;
                    } else {
                      showReadData = ShowReadData.show;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(Responsible.height*0.01),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(
                        Responsible.height*0.01,
                      )),
                  child: showReadData == ShowReadData.show
                      ? Text(
                          'Read More',
                          style: TextStyles().cardsTitle(),
                        )
                      : Text(
                          'Show Card',
                    style: TextStyles().cardsTitle(),
                        ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (isSaved) {
                    Routes(context:context).routePush(const Diary());
                  }else{
                    if (widget.data != null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.black12.withOpacity(0.5),
                          content: Text("Successfully saved in My Diary.",  style: TextStyles().cardsTitle(),)));
                      setState(() {
                        SavedDiary.setSave(true);
                        SaveCards().saveCards(widget.cardsIndex);
                        isSaved = SavedDiary.setDiary;
                      });
                    }
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(
                      Responsible.width*0.02
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(Responsible.height*0.01)),
                  child: Icon(
                    isSaved ? Icons.note_alt : Icons.save,
                    size: Responsible.fontSize*1.5,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showCard(double height) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              height: Responsible.width * 1.3,
              width: Responsible.width * 0.80,
              // height:20.0,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    widget.data![0],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget readData(double? height, String? title) {
    return Container(
      margin: EdgeInsets.only(
        // ignore: unnecessary_null_comparison
        top: title == ""
            ? Responsible.showDataContentTl
            : Responsible.height * 0.01,
        bottom: title == ""
            ? Responsible.showDataContentNH
            : Responsible.showDataContentH,
        left: Responsible.width * 0.02,
        right: Responsible.width * 0.02,
      ),
      height: Responsible.height * 0.9,
      padding:  EdgeInsets.all(Responsible.height*0.015),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(Responsible.height*0.012),
      ),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: widget.data![1].length,
          itemBuilder: (BuildContext context, int index) {
            return index != widget.data!.length ? Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Responsible.height * 0.01),
              child: Text(
                widget.data![1][index],
                style: index == 0 ? textStyleT() : textStyleD(),
              ),
            ):RichText(text: TextSpan(text: "Your Loved one’s message to you : ",style: textStyleH(), children: <InlineSpan>[TextSpan(text:widget.data![1][index].toString(),style: textStyleD())]));
          }),
    );
  }

  TextStyle textStyleH() {
    return TextStyle(
      fontSize: Responsible.fontSize * 1.13,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: 'kawoszeh',
    );
  }

  TextStyle textStyleT() {
    return TextStyle(
      fontSize: Responsible.fontSize,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'opensense',
    );
  }

  TextStyle textStyleD() {
    return TextStyle(
      fontFamily: 'opensense',
      fontSize: Responsible.fontSize,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

}
