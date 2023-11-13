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

        ],
      ),
    );
  }
}
