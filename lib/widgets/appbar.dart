import 'package:flutter/material.dart';
import 'package:passedloved/widgets/routes.dart';import '../data/data.dart';

import '../home/home_page.dart';
import 'responsible.dart';




class TitleBar{
  PreferredSizeWidget appBar(String? title, BuildContext? context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent.withOpacity(0.0),
      title: Text(
        title!,
        style: TextStyle(
          shadows: const <Shadow>[
            Shadow(
              offset: Offset(1.5, 2.0),
              blurRadius: 0.05,
              color: Colors.black,
            ),
          ],
          fontSize: Responsible.fontSize * 1.6,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
          fontFamily: "kawoszeh",
        ),
      ),
      leading: Container(
        margin: EdgeInsets.only(
          left: Responsible.width * 0.01,
        ),
        child: IconButton(
          onPressed: () {
            if(SavedDiary.setDiary){
              SavedDiary.setSave(false);
            }
            Navigator.pop(context!);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: Responsible.width * 0.06,
          ),
        ),
      ),
    );
  }
  AppBar NBar(String title, BuildContext context){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(title,style: TextStyle(color: Colors.white, fontFamily: "kawoszeh", fontSize: Responsible.fontSize*1.8, fontWeight: FontWeight.w600),),
      centerTitle: true,
      leading: Container(
        margin: EdgeInsets.only(
          left: Responsible.width * 0.01,
        ),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: Responsible.width * 0.06,
          ),
        ),
      ),
    );
  }
  AppBar DBar(String title, BuildContext context){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(title,style: TextStyle(color: Colors.white, fontFamily: "kawoszeh", fontSize: Responsible.fontSize*1.8, fontWeight: FontWeight.w600),),
      centerTitle: true,
      leading: Container(
        margin: EdgeInsets.only(
          left: Responsible.width * 0.01,
        ),
        child: IconButton(
          onPressed: () {
            Routes(context: context).routeReplace(const passedloved());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: Responsible.width * 0.06,
          ),
        ),
      ),
    );
  }
  Widget appbarCards(String title) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white.withOpacity(0.0),
      centerTitle: true,
      title: title != 'null'
          ? Column(
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: title,
              style: TextStyle(
                shadows: const <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 4.0),
                    blurRadius: 2.0,
                    color: Colors.black,
                  ),
                ],
                fontSize: Responsible.fontSize * 1.6,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
                fontFamily: "kawoszeh",
              ),
            ),
          ),
        ],
      )
          : const Text(''),
    );
  }

}
