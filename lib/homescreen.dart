import 'package:flutter/material.dart';
import 'package:hotelstask/shared/color.dart';
import 'package:csc_picker/csc_picker.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  static final GlobalKey<FormState> frmKey = GlobalKey<FormState>();
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String countryValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Image.asset(
            'assets/images/background.jpg',
             fit: BoxFit.fill,
             width: double.infinity,
             height: double.infinity,
           ),
          Container(
            margin: EdgeInsets.only(left: 20,bottom: 20),
            // padding: EdgeInsets.only(left: 20,right: 20) ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text("Hotel Search",style: TextStyle(color: ThemeColors.WhiteColor,fontSize: 18),),
                  color: ThemeColors.MainColor,
                ),
                SizedBox(height: 5,),
                Container(
                  padding: EdgeInsets.all(5),
                  color: ThemeColors.MainColor2,
                  child: Form(
                      key: HomeScreen.frmKey,
                    child: Column(
                      children: [
                        //TextField
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: ThemeColors.WhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            controller: TextEditingController(),
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value?.trim() == "" || value == null) {
                                return 'Please Enter The City';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                label: Text("Select The City"),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color:ThemeColors.MainColor2)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color:ThemeColors.MainColor2)),
                          ),
                        ),),
                        // Date RaNge
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: ThemeColors.WhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            controller: TextEditingController(),
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value?.trim() == "" || value == null) {
                                return 'Please Enter The City';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text("Select The City"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color:ThemeColors.MainColor2)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color:ThemeColors.MainColor2)),
                            ),
                          ),),
                        //DropDownList
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: ThemeColors.WhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: CSCPicker(
                            showStates: false,
                            showCities: false,
                            flagState: CountryFlag.DISABLE,
                            dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border:
                                Border.all(color: Colors.grey.shade300, width: 1)),
                            disabledDropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey.shade300,
                                border:
                                Border.all(color: Colors.grey.shade300, width: 1)),
                            countrySearchPlaceholder: "Countrfy",
                            countryDropdownLabel:countryValue =="" ?"Select Nationality":countryValue,
                            selectedItemStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            dropdownHeadingStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),

                            ///DropdownDialog Item style [OPTIONAL PARAMETER]
                            dropdownItemStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),

                            ///Dialog box radius [OPTIONAL PARAMETER]
                            dropdownDialogRadius: 10.0,

                            ///Search bar radius [OPTIONAL PARAMETER]
                            searchBarRadius: 10.0,

                            ///triggers once country selected in dropdown
                            onCountryChanged: (value) {
                              setState(() {
                                ///store value in country variable
                                countryValue = value;
                              });
                            },



                          ),
                          ),
                        //DropDown2
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: ThemeColors.WhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextFormField(
                            controller: TextEditingController(),
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value?.trim() == "" || value == null) {
                                return 'Please Enter The City';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              label: Text("Select The City"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color:ThemeColors.MainColor2)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color:ThemeColors.MainColor2)),
                            ),
                          ),),


                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: ThemeColors.ButtonColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                    ), child: Text("Search",style: TextStyle(color: ThemeColors.WhiteColor,fontSize: 18),),
                  ),


              ],
            ),
          ),


],
      ),
    );
  }
}
