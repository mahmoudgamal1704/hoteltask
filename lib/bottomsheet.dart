import 'package:flutter/material.dart';
import 'package:hotelstask/shared/color.dart';
import 'package:hotelstask/shared/roomdetails.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ReservationOption extends StatefulWidget {
  @override
  State<ReservationOption> createState() => _ReservationOptionState();
}

class _ReservationOptionState extends State<ReservationOption> {
  int RoomCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: ThemeColors.WhiteColor,
        title: Text(
          "Rooms and Guests",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 10, right: 10),
              color: ThemeColors.WhiteColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rooms"),
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
                            onPressed: RoomCount == 1
                                ? null
                                : () {
                                    if (RoomCount > 1) {
                                      RoomCount--;
                                    }

                                    setState(() {});
                                  },
                          ),
                        ),
                        Text("$RoomCount"),
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
                            onPressed: () {
                              RoomCount++;
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 6,
                        );
                      },
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: RoomCount,
                      itemBuilder: (context, index) {
                        return RoomDetails(index + 1);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    color: ThemeColors.WhiteColor,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [Text("Pet Friendly"), Icon(Icons.help)],
                            ),
                            Text(
                              "Only Show Stays that allow Pet",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: ToggleSwitch(
                            minWidth: 40.0,
                            cornerRadius: 20.0,
                            activeBgColors: [
                              [Colors.green[800]!],
                              [Colors.red[800]!]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            radiusStyle: true,
                          ),
                        ),

                      ],
                    ),
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
