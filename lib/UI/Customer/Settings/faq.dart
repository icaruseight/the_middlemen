import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  bool show = false; //Usage: show or unshow the answers
  bool invert = true;// Usage: The arrow becomes inverted when answer is shown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'FAQ'),
      backgroundColor: const Color(0xffF1F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      show = !show;
                      invert = !invert;
                    });
                  },
                  child: Column(
                    children: [
                      faqContent(invert: invert, show: show,
                      question: 'What does it cost for a shipment?',
                        answer: 'Costs for our delivery services will vary based upon the size and weight of the item, what type of package you require, how quickly you need the item delivered and the distance from your pick up point and delivery point. Contact us or use our calculate and ship for an accurate quote.',
                      ),
                      const SizedBox16(),
                      faqContent(invert: invert, show: show,
                          question: 'How quickly can you deliver my package?',
                          answer: 'We offer three different delivery packages that you can choose from. Through Express delivery your packages will be delivered quickly in a day but it will cost you a bit more. While you can also choose Standard and Cheap types which are less costly but will take longer time (2 or 3 days) to complete.'),
                      const SizedBox16(),
                      faqContent(invert: invert, show: show,
                          question: 'What hours are you open and when do you make deliveries?',
                          answer: 'We understand that not every delivery is going to fall in between normal business hours so we are conveniently open 24/7 and can make a delivery at any time of day or night.'),
                      const SizedBox16(),
                      faqContent(invert: invert, show: show,
                          question: 'How do you enquire about the delivery orders that you have made?',
                          answer: 'Simply use the Support feature and chat with the admin to know and enquire about the delivery orders.')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class faqContent extends StatelessWidget {
  const faqContent({
    Key? key,
    required this.invert,
    required this.show,
    required this.question,
    required this.answer
  }) : super(key: key);

  final bool invert;
  final bool show;
  final question;
  final answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffD8DDE0),
            //                   <--- border color
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: const Color(0xffFFFFFF)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: kStyleNormal.copyWith(
                        color: const Color(0xff252627)),
                  ),
                ),
                invert == true
                    ? Image.asset(
                  'assets/Settings/seemore.png',
                  height: 8,
                  width: 13,
                )
                    : Image.asset(
                  'assets/Settings/seemoreup.png',
                  height: 8,
                  width: 13,
                )
              ],
            ),
          ),
          show == true
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 12),
                child: Text(
                  answer,
                  style: kStyleNormal.copyWith(
                      fontSize: 10.sp),
                ),
              )
            ],
          )
              : Container()
        ],
      ),
    );
  }
}
