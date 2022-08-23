import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/Profile/cus_edit_profile.dart';

class SelectUserButton extends StatelessWidget {
  const SelectUserButton({required this.text,required this.onPress,required this.color});

  final text;
  final onPress;
  final color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 49,
          width: 156,
          child: ElevatedButton(
            onPressed: onPress,
            child: Text(
              text,
              style: kStyleButton.copyWith(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)))),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({required this.text,required this.onPress,required this.color});

  final text;
  final onPress;
  final color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          text,
          style: kStyleButton.copyWith(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)))),
      ),
    );
  }
}


class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(color: Color(0xffBBBFC2)))),
      child: Text(
        'EDIT PROFILE',
        style: kStyleButton,
      ),
    );
  }
}

class ArrowButton extends StatelessWidget {
  const ArrowButton(
      {required this.text,
        required this.color,
        required this.onPress,
        required this.arrow});

  final text;
  final color;
  final onPress;
  final arrow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 40.sp,
      child: ElevatedButton(
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 0,
            top: 8,
            bottom: 8,
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: kStyleButton.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    arrow,
                    /*         width: 35,
                    height: 35,*/
                  ),
                ],
              )
            ],
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)))),
      ),
    );
  }
}

class NextBtn extends StatefulWidget {
  NextBtn(this.onPress, this.text);

  final onPress;
  final text;

  @override
  State<NextBtn> createState() => _NextBtnState();
}

class _NextBtnState extends State<NextBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 92,
        child: ElevatedButton(
          onPressed: widget.onPress,
          child: Text(widget.text),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xff3F84FC)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ))),
        ),
      ),
    );
  }
}

class PreviousBtn extends StatefulWidget {
  PreviousBtn(this.onPress);

  final onPress;

  @override
  State<PreviousBtn> createState() => _PreviousBtnState();
}

class _PreviousBtnState extends State<PreviousBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 92,
        child: ElevatedButton(
          onPressed: widget.onPress,
          child: const Text(
            'Previous',
            style: TextStyle(color: Color(0xffFFFFFF)),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color(0xffA3A3A3)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              side: MaterialStateProperty.all(
                  BorderSide(color: const Color(0xffA3A3A3)))),
        ),
      ),
    );
  }
}

class MyLocationButton extends StatelessWidget {
  const MyLocationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.orange.shade100, // button color
        child: InkWell(
          splashColor: Colors.orange, // inkwell color
          child: const SizedBox(
            width: 56,
            height: 56,
            child: Icon(Icons.my_location),
          ),
          onTap: () {
            // TODO: Add the operation to be performed
            // on button tap
          },
        ),
      ),
    );
  }
}

class AddSubButton extends StatelessWidget {
  AddSubButton({required this.onPress,required this.icon});
  final onPress;
  final icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: FloatingActionButton(
        onPressed: onPress,
        child:   Icon(icon,
            color: Colors.black),
        backgroundColor: Colors.white,),
    );
  }
}

class NavigateButton extends StatelessWidget {
  NavigateButton({required this.onTap});
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xff00A6FB),
            border: Border.all(width: 2, color: const Color(0xff00A6FB))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.navigation,color: Colors.white,size: 15,),
              Expanded(
                child: FittedBox(
                  child: Text(
                    'Navigate',
                    style: kStyleTitle.copyWith(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CallButton extends StatelessWidget {
  CallButton({required this.onPress});

  final onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 32,
        width: 78,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(width: 2, color: const Color(0xff00A6FB))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.call_outlined,
                color: Color(0xff00A6FB),
                size: 15,
              ),
              Expanded(
                child: FittedBox(
                  child: Text(
                    'Call',
                    style: kStyleTitle.copyWith(
                        fontSize: 14,
                        color: Color(0xff00A6FB),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Used in dialog box
class dialogButton extends StatelessWidget {
  const dialogButton({
    Key? key,
    required this.tn,
    required this.onTap,
    required this.text,
    required this.color
  }) : super(key: key);

  final String? tn;
  final onTap;
  final text;
  final color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 120,
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),),
              backgroundColor: MaterialStateProperty.all(color),
            ),
            onPressed: onTap,
            child: Text(text,style: kStyleButton.copyWith(color: Colors.white),)));
  }
}
