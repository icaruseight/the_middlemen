import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';

Future<void> showFeedbackDialog(BuildContext context) => showDialog(
  barrierColor: kStyleMainBlue.withOpacity(0.24),
  //barrierDismissible: false,
  context: context,
  builder: (_) => Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: <Widget>[

      Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 190,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white),
          padding: const EdgeInsets.fromLTRB(20, 20, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "How would you rate your experience with The Middlemen?",
                    style: kStyleShowDialog.copyWith(
                        fontWeight: FontWeight.w700),textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),

                ],
              ),
              SizedBox(height: 16.sp),
              Center(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: kStyleAppColor,
                  ),
                  onRatingUpdate: (rating) async{

                    print(rating);
                  },
                ),
              ),
              Center(
                child: TextButton(onPressed: (){
                  Navigator.pop(context);
                  showReviewSubmittedDialog(context);

                }, child: const Text('Rate', style: TextStyle(color: kStyleAppColor),),),
              ),
              /*      SizedBox(height: 10.sp),*/
            ],
          ))
    ],
  ),
);

Future<void> showReviewSubmittedDialog(BuildContext context) => showDialog(
  barrierColor: kStyleMainBlue.withOpacity(0.24),
  //barrierDismissible: false,
  context: context,
  builder: (_) => Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: <Widget>[
      Container(
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white),
          padding: const EdgeInsets.fromLTRB(20, 20, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/Settings/reviewsubmitted.png', height: 64,),
              SizedBox(height: 32.sp),
              Text(
                "Review Submitted !",
                style: kStyleShowDialog.copyWith(
                    fontWeight: FontWeight.w700),textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.sp),
              Text(
                'Thank you for your review',
                style: kStyleNormal.copyWith(fontSize: 12.sp),
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);


              }, child: Text('Ok', style: TextStyle(color: Color(0xff00A6FB)),),),
            ],
          ))
    ],
  ),
);

Future<void> showBackDialog(BuildContext context) => showDialog(
  barrierColor: Colors.blueAccent.withOpacity(0.3),
  barrierDismissible: false,
  context: context,
  builder: (_) => Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.center,
    children: <Widget>[
      Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 145,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100]),
          padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Are you sure you want to exit?",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'NutinoSansReg',
                  letterSpacing: 0.4,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      /*    willLeave = false;*/
                      SystemNavigator.pop();
                    },
                    child: Text(
                      "Yes",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'NutinoSansReg',
                        letterSpacing: 0.4,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "No",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: 'NutinoSansReg',
                        letterSpacing: 0.4,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ))
    ],
  ),
);

Future<void> showWaitDialog(BuildContext context, String title) => showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) => AlertDialog(
    title: Center(
      child: Text(
        title,
        style: kStyleNormal.copyWith(
            fontFamily: 'InterMed',
            fontWeight: FontWeight.w500,
            fontSize: 12.sp),
      ),
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Image.asset('assets/UserType/loading.gif',height: 90,width: 90,)
      ],
    ),
  ),
);