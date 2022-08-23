import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/snackbar.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class CalculateAndShip extends StatefulWidget {
  const CalculateAndShip({Key? key}) : super(key: key);

  @override
  State<CalculateAndShip> createState() => _CalculateAndShipState();
}

class _CalculateAndShipState extends State<CalculateAndShip> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController breadthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController kmController = TextEditingController();


  List<String> packageIcon = [
    'assets/ShipNow/express.png',
    'assets/ShipNow/normal.png',
    'assets/ShipNow/cheap.png'
  ];

  List<String> title = [
    'Express Package',
    'Normal Package',
    'Cheap Package'
  ];

  List<String> desc = [
    '20% Extra Charge',
    '5% Extra Charge',
    'No Extra Charge',
  ];

  final List _selectedIndexs = [];

  int _n = 0;
  int _l = 0;
  int _b = 0;
  int _h = 0;
  int _km = 0;

  void add() {
    setState(() {
      _n++;
      weightController.text = '${_n.toString()} kg';
    });
  }
  void addl() {
    setState(() {
      _l++;
      lengthController.text = '${_l.toString()} cm';
    });
  }
  void addb() {
    setState(() {
      _b++;
      breadthController.text = '${_b.toString()} cm';
    });
  }
  void addh() {
    setState(() {
      _h++;
      heightController.text = '${_h.toString()} cm';
    });
  }
  void addkm() {
    setState(() {
      _km++;
      kmController.text = '${_km.toString()} km';
    });
  }
  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
      weightController.text = '${_n.toString()} kg';
    });
  }
  void minusl() {
    setState(() {
      if (_l != 0)
        _l--;
      lengthController.text = '${_l.toString()} cm';
    });
  }
  void minusb() {
    setState(() {
      if (_b != 0)
        _b--;
      breadthController.text = '${_b.toString()} cm';
    });
  }
  void minush() {
    setState(() {
      if (_h != 0)
        _h--;
      heightController.text = '${_h.toString()} cm';
    });
  }

  void minuskm() {
    setState(() {
      if (_km != 0)
        _km--;
      kmController.text = '${_km.toString()} km';
    });
  }

  double DimCalculator(){
    var dimWeight = (_l * _b * _h)/5000;
    return dimWeight;
  }

  List<String> type = ['Documents', 'Parcel'];

  List<String> typeImg = ['assets/ShipNow/mail.png', 'assets/ShipNow/parcel.png'];

  final List _selectedType = [];

  parcelCost(){
    double p;

    if(_selectedType.contains(0)){

      p = 300;
    }else{
      if(DimCalculator() > DimCalculator()){
        p = 800;
      }else{
        p = 500;
      }
    }
    return p;
  }

  packageCost(){
    double pacCost = parcelCost();
    if(_selectedIndexs.contains(0)){
      pacCost = (pacCost + ((20/100)*pacCost));
    }
    else if(_selectedIndexs.contains(1)){
      pacCost = (pacCost + ((5/100)*pacCost));
    }
    else{
      pacCost;
    }
    return pacCost;
  }

  pacType(){
    String package;
    if(_selectedIndexs.contains(0)){
      package = 'Express';
    }else if(_selectedIndexs.contains(1)){
      package = 'Standard';
    }else{
      package = 'Cheap';
    }
    return package;
  }

  var distRate;
  distanceRate(){
    var distget = kmController.text.replaceAll('km', '');
    var dist = double.parse(distget);
    if(dist <= 5){
      dist = 40;
    }else if (dist > 5 && dist <= 10){
      dist = 400;
    }else if (dist > 10 && dist <= 20){
      dist = 600;
    }else if (dist > 20 && dist <= 50){
      dist = 1000;
    }else if (dist > 50 && dist <= 100){
      dist = 1500;
    }else if (dist > 100){
      dist = 2000;
    }
    return dist;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: 'Calculate and Ship',),
      backgroundColor: kStyleBackground,
      body: ListView(
        children: [
          Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Please select your package type',
                    style: kStyleTitle.copyWith(fontSize: 12.sp),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox16(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.34,
                    //Select Parcel Type
                    child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          final _isSelectedParcelType = _selectedType.contains(index);
                          return SelectTypeContainer(
                            type: type[index],
                            image: typeImg[index],
                            onPress: () {
                              setState(
                                    () {
                                  if (_isSelectedParcelType) {
                                    _selectedType.remove(index);
                                  } else if (_selectedType.isNotEmpty) {
                                    _selectedType.clear();
                                    _selectedType.add(index);
                                  } else {
                                    _selectedType.add(index);
                                  }
                                },
                              );
                            },
                            isSelected: _isSelectedParcelType,
                          );
                        }),
                  ),
                  itemDivider(),
                  const SizedBox16(),

                  // SizedBox16(),
                  // Image.asset('assets/ShipNow/weight.png'),

                  //Dropdown menus to select size and weight
                  Visibility(
                    visible: _selectedType.contains(0) == true ? false : true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What is your package weight?',
                          style: kStyleTitle.copyWith(fontSize: 12.sp),
                        ),
                        const SizedBox16(),
                        Text('Weight:',style: kStyleNormal.copyWith(fontSize: 10.sp),),
                        const SizedBox16(),
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: WeightFormField(
                                hintText: '0 kg',
                                icon: Icons.wysiwyg_rounded,
                                controller: weightController,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a valid weight";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 2.w,),
                            AddSubButton(onPress: add,icon: Icons.add,),
                            SizedBox(width: 2.w,),
                            AddSubButton(onPress: minus,icon: Icons.remove),
                          ],
                        ),
                        const SizedBox16(),
                        Text('Calculate Dimensional Weight:',style: kStyleNormal,),
                        const SizedBox16(),
                        Text('Length:',style: kStyleNormal.copyWith(fontSize: 10.sp),),
                        const SizedBox16(),
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: WeightFormField(
                                hintText: '0 cm',
                                icon: Icons.wysiwyg_rounded,
                                controller: lengthController,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a valid weight";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 2.w,),
                            AddSubButton(onPress: addl,icon: Icons.add,),
                            SizedBox(width: 2.w,),
                            AddSubButton(onPress: minusl,icon: Icons.remove),
                          ],
                        ),
                        const SizedBox16(),
                        Text('Breadth:',style: kStyleNormal.copyWith(fontSize: 10.sp),),
                        const SizedBox16(),
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: WeightFormField(
                                hintText: '0 cm',
                                icon: Icons.wysiwyg_rounded,
                                controller: breadthController,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a valid weight";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 2.w,),
                            AddSubButton(onPress: addb,icon: Icons.add,),
                            SizedBox(width: 2.w,),
                            AddSubButton(onPress: minusb,icon: Icons.remove),
                          ],
                        ),
                        const SizedBox16(),
                        Text('Height:',style: kStyleNormal.copyWith(fontSize: 10.sp),),
                        const SizedBox16(),
                        Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: WeightFormField(
                                hintText: '0 cm',
                                icon: Icons.wysiwyg_rounded,
                                controller: heightController,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a valid weight";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 2.w,),
                            AddSubButton(onPress: addh,icon: Icons.add,),
                            SizedBox(width: 2.w,),
                            AddSubButton(onPress: minush,icon: Icons.remove),
                          ],
                        ),
                        const SizedBox16(),
                        Text('The Dimensional Weight is: ${DimCalculator()} kg',style: kStyleNormal,),
                        const SizedBox16(),
                        itemDivider(),
                        const SizedBox16(),


                      ],
                    ),
                  ),
                  Text('Please enter the distance of the delivery:',style: kStyleNormal,),
                  const SizedBox16(),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: WeightFormField(
                          hintText: '0 km',
                          icon: Icons.wysiwyg_rounded,
                          controller: kmController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Please enter a valid weight";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(width: 2.w,),
                      AddSubButton(onPress: addkm,icon: Icons.add,),
                      SizedBox(width: 2.w,),
                      AddSubButton(onPress: minuskm,icon: Icons.remove),
                    ],
                  ),
                  const SizedBox16(),
                  itemDivider(),
                  const SizedBox16(),
                  Text('Please select your package type',style: kStyleTitle.copyWith(fontSize: 12.sp),textAlign: TextAlign.center,),
                  const SizedBox16(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index){
                          final _isSelected = _selectedIndexs.contains(index);
                          return PackageOption(
                            packageIcon: packageIcon[index],
                            onTap: () {
                              setState(
                                    () {
                                  if (_isSelected) {
                                    _selectedIndexs.remove(index);
                                  } else if (_selectedIndexs.isNotEmpty) {
                                    _selectedIndexs.clear();
                                    _selectedIndexs.add(index);
                                  } else {
                                    _selectedIndexs.add(index);
                                  }
                                },
                              );
                            },
                            isSelected: _isSelected,
                            title: title[index],
                            desc: desc[index],
                          );
                        }),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      if(_selectedType.isNotEmpty && (_selectedType.contains(0) == true ? _selectedType.contains(0) : weightController.text != '0 kg' && DimCalculator() != 0) && kmController.text != '0 km' && _selectedIndexs.isNotEmpty)
                        {
                          showDialog(barrierColor: Colors.blueAccent.withOpacity(0.3),
                              barrierDismissible: false,
                              context: context,
                              builder: (_) => Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      height: MediaQuery.of(context).size.height * 0.17,
                                      width: MediaQuery.of(context).size.width * 0.8,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(16)
                                      ),
                                      child: Column(
                                        children: [
                                          PricingContent(title: 'Price',amt: 'Rs. ${parcelCost()}',titleStyle: kStyleNormal,amtStyle: kStyleNormal,),
                                          const SizedBox8(),
                                          PricingContent(title: 'Distance Rate',amt: 'Rs. ${distanceRate()}',titleStyle: kStyleNormal,amtStyle: kStyleNormal),
                                          const SizedBox8(),
                                          PricingContent(title: 'Package Type (${pacType()})',amt: 'Rs. ${packageCost() - parcelCost()}',titleStyle: kStyleNormal,amtStyle: kStyleNormal),
                                          const SizedBox8(),
                                          PricingContent(title: 'Total Amount',amt: 'Rs. ${packageCost() + distanceRate()} ',titleStyle: kStyleNormal.copyWith(color: Colors.blue),amtStyle: kStyleNormal.copyWith(color: Colors.blue)),
                                        ],
                                      ),
                                    )
                                  ])
                          );
                        }else{
                        showSnackBar(
                          context,
                          "Attention",
                          Colors.red,
                          Icons.info,
                           "Please select all the fields",
                        );
                      }
                      }, child: Text('Get Quotation',style: kStyleButton.copyWith(color: Colors.white),)),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
