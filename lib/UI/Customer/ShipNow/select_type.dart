import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:the_middlemen/Change%20Notifier/change_notifier.dart';
import 'package:the_middlemen/Constants/const.dart';
import 'package:the_middlemen/UI/Customer/ShipNow/select_destination.dart';
import 'package:the_middlemen/Widgets/appbars.dart';
import 'package:the_middlemen/Widgets/buttons.dart';
import 'package:the_middlemen/Widgets/extracted_widgets.dart';
import 'package:the_middlemen/Widgets/textformfields.dart';

class SelectType extends StatefulWidget {
  const SelectType({Key? key}) : super(key: key);

  @override
  State<SelectType> createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {
  String? _weightChoose = 'Select weight';
  String? _sizeChoose = 'Select size';
  final TextEditingController weightController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController breadthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  int _n = 0;
  int _l = 0;
  int _b = 0;
  int _h = 0;

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

  double DimCalculator(){
    var dimWeight = (_l * _b * _h)/5000;
    return dimWeight;
  }

  List<String> type = ['Documents', 'Parcel'];

  List<String> typeImg = ['assets/ShipNow/mail.png', 'assets/ShipNow/parcel.png'];

  final List _selectedType = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kStyleBackground,
      appBar: CustomAppBar(title: 'Ship Now',),
      body: ListView(
        children: [
          Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Step 1 of 6',
                    style: kStyleTitle,
                  ),
                  const SizedBox16(),
                  Text(
                    'What are you Sending?\nPlease select your package type',
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
                  const SizedBox(
                    width: double.infinity,
                    child: Divider(
                      thickness: 0.7,
                      color: Colors.grey,
                    ),
                  ),
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
                        Text('The Dimensional Weight is: ${DimCalculator()} kg',style: kStyleNormal,)
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * 0.15.sp,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if(_selectedType.isNotEmpty && (_selectedType.contains(0) == true ? _selectedType.contains(0) : weightController.text != '0 kg' && DimCalculator() != 0))
              NextBtn(()
              {
                context.read<DataProvider>().partype(_selectedType,_selectedType.contains(0) == true ? '0' : weightController.text.replaceAll('kg', ''),_selectedType.contains(0) == true ? 0.0 : DimCalculator());
                Navigator.of(context).pushReplacement(CustomPageRoute(child: const SelectDestination()));
              },'Next'),
          ],
        ),
      ),
    );
  }
}




