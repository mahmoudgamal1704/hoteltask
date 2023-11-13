import 'package:flutter/material.dart';
import 'package:hotelstask/bottomsheet.dart';
import 'package:hotelstask/shared/color.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  static final GlobalKey<FormState> frmKey = GlobalKey<FormState>();
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  String countryValue = "";
  DateRange? selectedDateRange;
  List<String> roomList = ['1 Room,2 Adult , 0 Children',"onchange"];
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<int>>();
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
            margin: EdgeInsets.only(left: 20,right: 20),
            // padding: EdgeInsets.only(left: 20,right: 20) ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  // decoration: BoxDecoration(
                  //
                  // ),
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
                        SizedBox(height: 5,),
                        // Date RaNge
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: ThemeColors.WhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child:DateRangeField(
                            decoration: const InputDecoration(
                              label: Text("Please select a date range"),
                              hintText: 'Please select a date range',
                            ),
                            onDateRangeSelected: (DateRange? value) {
                              setState(() {
                                selectedDateRange = value;
                              });
                            },
                            selectedDateRange: selectedDateRange,
                            pickerBuilder: datePickerBuilder,
                          ),
                        ),
                        SizedBox(height: 5,),
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
                        SizedBox(height: 5,),
                        //DropDown2
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: ThemeColors.WhiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: DropdownSearch<String>(
                            items: roomList,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: roomList.first,
                                hintText: roomList.first,
                              ),
                            ),

                          ),

                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                GestureDetector(
                  onTap: (){
                    openBottomSheet(context);

                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ThemeColors.ButtonColor,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                      ), child: Text("Search",style: TextStyle(color: ThemeColors.WhiteColor,fontSize: 18),),
                    ),
                ),


              ],
            ),
          ),


],
      ),
    );
  }
  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ReservationOption(),
        );
      },
    );
  }
  Widget datePickerBuilder(
      BuildContext context, dynamic Function(DateRange?) onDateRangeChanged,
      [bool doubleMonth = true]) =>
      DateRangePickerWidget(
        doubleMonth: doubleMonth,
        maximumDateRangeLength: 10,
        quickDateRanges: [
          QuickDateRange(dateRange: null, label: "Remove date range"),
          QuickDateRange(
            label: 'Last 3 days',
            dateRange: DateRange(
              DateTime.now().subtract(const Duration(days: 3)),
              DateTime.now(),
            ),
          ),
          QuickDateRange(
            label: 'Last 7 days',
            dateRange: DateRange(
              DateTime.now().subtract(const Duration(days: 7)),
              DateTime.now(),
            ),
          ),
          QuickDateRange(
            label: 'Last 30 days',
            dateRange: DateRange(
              DateTime.now().subtract(const Duration(days: 30)),
              DateTime.now(),
            ),
          ),
          QuickDateRange(
            label: 'Last 90 days',
            dateRange: DateRange(
              DateTime.now().subtract(const Duration(days: 90)),
              DateTime.now(),
            ),
          ),
          QuickDateRange(
            label: 'Last 180 days',
            dateRange: DateRange(
              DateTime.now().subtract(const Duration(days: 180)),
              DateTime.now(),
            ),
          ),
        ],
        minimumDateRangeLength: 2,
        initialDateRange: selectedDateRange,
        disabledDates: [DateTime(2023, 11, 20)],
        initialDisplayedDate:
        selectedDateRange?.start ?? DateTime(2023, 11, 20),
        onDateRangeChanged: onDateRangeChanged,
      );
}
