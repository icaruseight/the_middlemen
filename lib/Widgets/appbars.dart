import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Select%20User/select_user.dart';

class BottomNavAppBar extends StatelessWidget with PreferredSizeWidget {
  BottomNavAppBar({required this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      title: Text(
        title,
        style: kStyleButton.copyWith(
            fontWeight: FontWeight.w400, fontSize: 14.sp),
      ),
      /* toolbarHeight: 60,*/
      titleSpacing: 16,
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({required this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: kStyleButton.copyWith(
            fontWeight: FontWeight.w400, fontSize: 14.sp),
      ),
      /* toolbarHeight: 60,*/
      titleSpacing: 16,
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}

class BackAppBar extends StatelessWidget {
  final Widget bodyPass;
  final title;

  BackAppBar({
      required this.title,
      required this.bodyPass,
      }
      );

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
                padding: EdgeInsets.only(
                  left: 18,
                  top: 16,
                  bottom: 16,
                  right: 14,
                ),
                child: Icon(Icons.arrow_back_ios,color: kStyleAppColor,)
            ),
          ),
          centerTitle: true,
          title: Text(title,style: kStyleTitle,),
        ),
        body: bodyPass,
      );

  }
}