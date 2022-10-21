import 'package:passedloved/data/data.dart';
import 'package:passedloved/widgets/responsible.dart';
import 'package:flutter/material.dart';

import '../widgets/textStyles.dart';

class GuideBook extends StatefulWidget {
  const GuideBook({Key? key}) : super(key: key);

  @override
  _GuideBookState createState() => _GuideBookState();
}

class _GuideBookState extends State<GuideBook> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Responsible.height * 0.60),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: Responsible.height*0.01,
                  left: Responsible.width*0.03,
                  right: Responsible.width*0.03,
                ),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  icon:  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: Responsible.fontSize*1.5,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin:  EdgeInsets.only(top: Responsible.height*0.01),
                  padding:  EdgeInsets.only(
                      right: Responsible.width*0.03, top: Responsible.height*0.01, bottom: Responsible.height*0.01),
                  child: Text(
                    StaticData.guidBookTitle,
                    softWrap: true,
                    maxLines: 4,
                    style: TextStyles().mediumTitle(),
                  )
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.5),
                ),
                margin: EdgeInsets.only(
                  left: Responsible.width * 0.03,
                  right: Responsible.width * 0.03,
                  bottom: Responsible.height * 0.03,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: Responsible.width * 0.03,
                  vertical: Responsible.height * 0.02,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      description(
                          'These cards are designed to guide you in answering some of life’s most-deepest and most personal questions. Each card focuses on a specific aspect of your life. With each card, you will see suggestions, answers, and guidance to lead you into the process of personal development and success. If you are serious about making life changes, living more consciously aware and progressing on a soul level, then these cards will get you there faster.'),
                       SizedBox(height:  Responsible.height*0.012),
                      description(
                          'It will be important to take time out and let the cards speak to you on a deeper level before jumping into new questions. Allow time to process the information that comes to you. It takes time before coming into your full spiritual power.'),
                       SizedBox(height: Responsible.height*0.012),
                      heading('One Card Spread'),
                       SizedBox(height:  Responsible.height*0.012),
                      description(
                          'This is a great way to get focused on your day. Use this as a review of your day or to set a focus for the following day. You can also choose a card to have focus for dream travel or dream interpretation.'),
                       SizedBox(height:  Responsible.height*0.012),
                      heading('Love Spread'),
                       SizedBox(height:  Responsible.height*0.012),
                      description(
                          'Concentrate on the main question you have surrounding love before choosing the cards. The two cards can be what you personally need to focus on for love to enter your life or to help a current relationship. Or you can choose one card for you and one about the person you may be inquiring about. You can use the two cards to ask about characteristics of your soulmate.'),
                       SizedBox(height:  Responsible.height*0.012),
                      heading('A three card spread'),
                       SizedBox(height:  Responsible.height*0.012),
                      description(
                          'is also an excellent way to work with the deck. The first card represents the situation at hand, the second card shows what you are missing in the situation. The third card will show the most important lesson to get past. Also you can use it for past, now and future.'),
                       SizedBox(height:  Responsible.height*0.012),
                      heading('Past, Now and in the future'),
                       SizedBox(height:  Responsible.height*0.012),
                      description(
                          'A time-line three card spread is my highest suggestion. In this layout, you simply look for the past, now and future. The first card is the past behaviours and actions. The second card is the result of those choices and actions. The third card is where you will go if no changes occur or no new changes are made. Any cards afterwards are further results of the choices already made. This can be followed up by three more cards and by asking that if good and different changes are made, then what would the future bring? This helps one look at the process which should be made in order to make the appropriate changes for a brighter, happier and more enlightened future.'),
                       SizedBox(height:  Responsible.height*0.012),
                      heading('Past Life Spread'),
                       SizedBox(height:  Responsible.height*0.012),
                      description(
                          'This spread is designed to help you understand any patterns or energies you may be holding onto from past lives. Uncover challenges from previous incarnations that are still present today. Look for gifts that you brought back with you. Use them for a higher purpose.'),
                       SizedBox(height:  Responsible.height*0.012),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: description(
                            '⦁	Energy or Pattern carried into this life from past life incarnations.'),
                      ),
                       SizedBox(height:  Responsible.height*0.012),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: description(
                            '⦁	Energy Patterns created in this life that are not associated with past lives.'),
                      ),
                       SizedBox(height:  Responsible.height*0.012),
                      Container(
                        alignment: Alignment.topLeft,
                        padding:  EdgeInsets.symmetric(horizontal: Responsible.width*0.01),
                        child: description(
                            '⦁	Gifts brought forth into this life from past incarnations.'),
                      ),
                       SizedBox(height:  Responsible.height*0.012),
                      Container(
                        alignment: Alignment.topLeft,
                        padding:  EdgeInsets.symmetric(horizontal: Responsible.width*0.03),
                        child: description(
                            '⦁	The Greatest Challenge to overcome in this life.'),
                      ),
                       SizedBox(height:  Responsible.height*0.012),
                      Container(
                        alignment: Alignment.topLeft,
                        padding:  EdgeInsets.symmetric(horizontal: Responsible.width*0.03),
                        child: description(
                            '⦁	Karma that needs undoing from past lives.'),
                      ),
                       SizedBox(height:  Responsible.height*0.012),
                      Container(
                        alignment: Alignment.topLeft,
                        padding:  EdgeInsets.symmetric(horizontal: Responsible.width*0.03),
                        child: description(
                            '⦁	Lessons to review from this life carried forward from other incarnations.'),
                      ),
                       SizedBox(height:  Responsible.height*0.012),
                      Container(
                        alignment: Alignment.topLeft,
                        padding:  EdgeInsets.symmetric(horizontal: Responsible.width*0.03),
                        child: description(
                            '⦁	What to focus on in order to overcome the main lesson caused from past lives.'),
                      ),
                       SizedBox(height:  Responsible.height*0.012),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(horizontal: Responsible.width*0.03),
                        child: description(
                            '⦁	Next steps or what to work on in order to see results about that main lesson.'),
                      ),
                       SizedBox(height:  Responsible.height*0.01),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: description(
                            '⦁	What to focus on in order to see growth and learn from these old patterns.'),
                      ),
                       SizedBox(height: Responsible.height*0.012),
                      heading('One year Spread'),
                       SizedBox(height:  Responsible.height*0.012),
                      description(
                          'Decide what month to begin from and choose twelve cards to see what the year has to offer and what to work on or pay attention to within each of those months.'),
                       SizedBox(height:  Responsible.height*0.012),
                      heading('Mental, Physical, Spiritual, Emotional Spread'),
                       SizedBox(height:  Responsible.height*0.012),
                      description(
                          'Use this spread to review what to work on within these important areas of your life. This can be done daily, weekly, monthly or in general.'),
                       SizedBox(height:  Responsible.height*0.012),
                      heading('Leave No Doors Open'),
                       SizedBox(height:  Responsible.height*0.012),
                      description(
                          'Doing readings of any kind invokes our spiritual guides to help us and to love us. It is respectful when you enter another\'s house to close any doors that you have opened. The process is the same in the spirit world. When we have called on our guides for assistance, it is to be done with the upmost respect. I suggest to work with the Archangels when doing any kind of spirit work. Archangel Michael lovingly offers assistance, watching over this deck. He will gently remind you to close any doors you open and assist in the times you may forget.'),
                       SizedBox(height:  Responsible.height*0.012),
                      heading(
                          'Activating your cards and/or Clearing the Card Deck'),
                       SizedBox(height:  Responsible.height*0.012),
                      description(
                          'I like to think of cards within an App just as sacred as physical cards are. When we use oracle cards, they work better when we use them in a humble and respectful way. As you would in person, imagine touching each card before you begin, and tell each one a special and humble “thank you”. Give an offering to the Nature Spirits. You may place this offering at a tree, in a river, or at another place outdoors that is special to you. This will deepen the connection with your card deck. Ask Archangel Michael to connect with the cards. Next, knock on something natural three times and then breathe slowly into the cards on your screen. This will be Archangel Michael\'s breath through yours; bringing a special blessing that will stay in the cards. Say a special prayer, or something positive, to continually raise the vibrations of the cards. You can do this process again and again, at any time if you feel that you need to reconnect with the cards.'),
                       SizedBox(height: Responsible.height*0.012),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget heading(String title) {
    return Text(
      title,
      style: TextStyles().normalTitle(),
      textAlign: TextAlign.center,
    );
  }

  Widget description(String description) {
    return Text(
      description,
      style: TextStyles().normalReading(),
    );
  }
}
