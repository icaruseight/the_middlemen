import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';

class TabBarTabs extends StatelessWidget {
  String text;
  final image;

  TabBarTabs({required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Padding(
        padding: EdgeInsets.only(
            left: 8, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(image),
            const SizedBox(width: 6,),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarTabsD extends StatelessWidget {
  String text;

  TabBarTabsD({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Padding(
        padding: EdgeInsets.only(
            left: 8, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

//For Profile Items
class ContentItems extends StatelessWidget {
  const ContentItems(
      {Key? key,
        required this.image,
        required this.label,
        required this.containerDesignType,
        required this.onTap})
      : super(key: key);

  final image;
  final label;
  final containerDesignType;
  final onTap;

  final kRadius = const Radius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kStyleContainer,
          boxShadow: [
            containerDesignType == "bottom" ? boxShadow : const BoxShadow(),
          ],
          borderRadius: containerDesignType == "top"
              ? BorderRadius.only(topLeft: kRadius, topRight: kRadius)
              : containerDesignType == "bottom"
              ? BorderRadius.only(bottomLeft: kRadius, bottomRight: kRadius)
              : containerDesignType == "both"
              ? const BorderRadius.all(Radius.circular(0.0))
              : const BorderRadius.all(Radius.circular(0.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(height: 22, width: 22, child: Image.asset(image,color: Colors.black,)),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    label,
                    style: kStyleButton.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: 22,
                  width: 22,
                  child: Image.asset('assets/Profile/forwardarrow.png'))
            ],
          ),
        ),
      ),
    );
  }
}

//Divider
Widget itemDivider() {
  return const SizedBox(
    width: double.infinity,
    height: 0,
    child: Divider(
      color: Colors.black,
      thickness: 0.5,
    ),
  );
}

//Features Container (Home Page)
class Features extends StatelessWidget {
  Features({required this.icon,required this.text,required this.onPress});

  final icon;
  final text;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 165,
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: kStyleContainer,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [boxShadow]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(height: 8,),
            Text(text,style: kStyleTitle.copyWith(fontSize: 13.sp),)
          ],
        ),
      ),
    );
  }
}

//Driver Profile Content
class profileContent extends StatelessWidget {
  profileContent({required this.icon,required this.desc,required this.value});
  final icon;
  final desc;
  final value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: kStyleAppColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            boxShadowBlue,
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Image(image: AssetImage(icon),width: 34,height: 34,),
              backgroundColor: Colors.white,
              radius: 24,
            ),
            const SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(desc,style: kStyleNormal.copyWith(fontWeight: FontWeight.w500,),),
                SizedBox(height: 4,),
                Text(value,style: kStyleNormal.copyWith(color: const Color(0xff71777C),fontSize: 12,fontWeight: FontWeight.w400),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

//Select Type (Ship Now)
class SelectTypeContainer extends StatelessWidget {
  SelectTypeContainer({required this.type, required this.image,required this.onPress,required this.isSelected});

  final type;
  final image;
  final onPress;
  final isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPress,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                color: isSelected ? kStyleAppColor : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [boxShadowBlue]
            ),
            child: Image.asset(image),
          ),
        ),
        const SizedBox16(),
        Center(child: Text(type,style: kStyleNormal,))
      ],
    );
  }
}
//Dropdown menu (SelectType)
class DropDown extends StatelessWidget {
  const DropDown({
    Key? key,
    required this.weight,
    required String? weightChoose,
    required this.onTap,
  }) : _weightChoose = weightChoose, super(key: key);

  final List<String> weight;
  final String? _weightChoose;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding:
        EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [boxShadowBlue]),
        child: DropdownButton(
          dropdownColor: kStyleAppColor,
          icon: Icon(Icons.wysiwyg_rounded),
          isExpanded: true,
          style: kStyleNormal,
          items: weight.map((item) {
            return DropdownMenuItem<String>(
                value: item, child: Text(item));
          }).toList(),
          onChanged: onTap,
          value: _weightChoose,
        ),
      ),
    );
  }
}

//PackageOption (Select Package ShipNow)
class PackageOption extends StatelessWidget {
  const PackageOption({
    Key? key,
    required this.packageIcon,
    required this.onTap,
    required this.isSelected,
    required this.title,
    required this.desc
  }) : super(key: key);

  final packageIcon;
  final onTap;
  final isSelected;
  final title;
  final desc;

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        decoration: BoxDecoration(
            color: /*isSelected ? kStyleAppColor : */Colors.white,
            boxShadow: [boxShadowBlue],
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            Image.asset(packageIcon,height: 40,width: 40 ,),
            SizedBox(width: 4.w,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: kStyleTitle,),
                      SizedBox(height: 8,),
                      Text('$desc',style: kStyleNormal.copyWith(height: 1.5),textAlign: TextAlign.left,)
                    ],
                  ),
                  // const SizedBox16(),
                  // Text('$desc',style: kStyleNormal.copyWith(height: 1.5),textAlign: TextAlign.center,),
                  Icon(
                    isSelected? Icons.check_circle : Icons.circle,
                    color: isSelected ? Colors.blue : Color(0xFFA3A3A3),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

//Navigation Animator
class CustomPageRoute extends PageRouteBuilder{
  final Widget child;
  final AxisDirection direction;

  CustomPageRoute({required this.child, this.direction = AxisDirection.left }) : super(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) => child
  );

  @override
  Widget buildTransitions (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition( position: Tween<Offset>(
        begin: getBeginOffset(),
        end: Offset.zero,
      ).animate(animation),
      child: child,);

  getBeginOffset(){
    switch (direction){
      case AxisDirection.left:
        return Offset(1, 0);
      case AxisDirection.right:
        return Offset(-1,0);
    }
  }
}

//Pricing Details (Select Payment)
class PricingContent extends StatelessWidget {
  PricingContent({required this.title, required this.amt,required this.titleStyle,required this.amtStyle});

  final title;
  final amt;
  final titleStyle;
  final amtStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
        style: titleStyle,),
        Text(amt,
        style: amtStyle,)
      ],
    );
  }
}

//Payment Options (Select Payment)
class PaymentOptions extends StatelessWidget {
  PaymentOptions({required this.icon, required this.name, required this.onTap,required this.isSelected});

  final icon;
  final name;
  final onTap;
  final isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [boxShadowBlue]),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 23,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: kStyleNormal,
                  ),
                  Icon(
                    isSelected? Icons.check_circle : Icons.circle,
                    color: isSelected ? Colors.blue : Color(0xFFA3A3A3),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//My Orders List Page
class OrdersListContent extends StatelessWidget {
  const OrdersListContent({
    Key? key,
    required this.color,
    required this.trackingNo,
    required this.image,
    required this.receiver,
    required this.price,
    required this.onTap
  }) : super(key: key);

  final color;
  final String trackingNo;
  final image;
  final receiver;
  final price;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [boxShadowBlue],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 31,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Image.asset(image,height: 40,width: 40,)),
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tracking Number:\n$trackingNo',style: kStyleNormal,),
                  const SizedBox16(),
                  Text('Receiver: $receiver',style: kStyleNormal,),
                  const SizedBox16(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Price: Rs. $price',style: kStyleNormal,),
                      // Text('Tap to View Details',style: kStyleNormal.copyWith(fontSize: 10.sp,color: Colors.grey),)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}