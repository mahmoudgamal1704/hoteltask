import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hotelstask/shared/color.dart';

class RoomDetails extends StatefulWidget {
  final roomnum;

  RoomDetails(this.roomnum);

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  int adultnum = 1;
  int childnum = 0;
  List<String> childYears = [
    "1 Year",
    "2 Years",
    "3 Years",
    "4 Years",
    "5 Years",
    "6 Years",
    "7 Years",
    "8 Years",
    "9 Years",
    "10 Years",
    "11 Years",
    "12 Years",
    "13 Years",
    "14 Years",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ThemeColors.WhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Room ${widget.roomnum}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Adults"),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blue),
                        color: ThemeColors.WhiteColor,
                      ),
                      child: IconButton(
                        disabledColor: Colors.grey,
                        icon: Icon(Icons.remove),
                        onPressed: adultnum == 1
                            ? null
                            : () {
                                if (adultnum > 1) {
                                  adultnum--;
                                }

                                setState(() {});
                              },
                      ),
                    ),
                    Text("$adultnum"),
                    Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blue),
                        color: ThemeColors.WhiteColor,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        onPressed: adultnum == 4
                            ? null
                            : () {
                                adultnum++;
                                setState(() {});
                              },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Children"),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blue),
                        color: ThemeColors.WhiteColor,
                      ),
                      child: IconButton(
                        disabledColor: Colors.grey,
                        icon: Icon(Icons.remove),
                        onPressed: childnum == 0
                            ? null
                            : () {
                                if (childnum > 0) {
                                  childnum--;
                                }
                                setState(() {});
                              },
                      ),
                    ),
                    Text("$childnum"),
                    Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blue),
                        color: ThemeColors.WhiteColor,
                      ),
                      child: IconButton(
                        disabledColor: Colors.grey,
                        icon: Icon(
                          Icons.add,
                        ),
                        onPressed: childnum == 4
                            ? null
                            : () {
                                childnum++;
                                setState(() {});
                              },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: childnum,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex:4,
                      child: Text("Age of Child ${index + 1}")),
                  Expanded(
                    child: DropdownSearch<String>(
                      items: childYears,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Select Child Age",
                          hintText: childYears.last,
                        ),
                      ),

                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
