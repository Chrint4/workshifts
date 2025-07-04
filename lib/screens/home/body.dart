import 'package:flutter/material.dart';
import 'package:workshifts/common/constants.dart';
import 'package:workshifts/common/extensions.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [HeaderWithSearchBox(size: size)]),
    );
  }
}

class HeaderWithSearchBox extends StatefulWidget {
  const HeaderWithSearchBox({super.key, required this.size});

  final Size size;

  @override
  State<HeaderWithSearchBox> createState() => _HeaderWithSearchBoxState();
}

class _HeaderWithSearchBoxState extends State<HeaderWithSearchBox> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.2,
      // color: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding + 36,
            ),
            height: widget.size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryCol,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(36),
                bottomLeft: Radius.circular(36),
              ),
            ),
            child: Row(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hours this Month: ",
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                    ),
                    Text(
                      "26",
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                          ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.output, color: Colors.white, size: 32),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryCol.withOpacity(0.23),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Expanded(
                    //   child: GestureDetector(
                    //     onTap: () async {
                    //       DateTime? pickedDate = await showDatePicker(
                    //         context: context,
                    //         initialDate: DateTime.now(),
                    //         firstDate: DateTime(2000),
                    //         lastDate: DateTime(2100),
                    //       );
                    //       // Handle pickedDate as needed
                    //     },
                    //     child: AbsorbPointer(
                    //       child: TextField(
                    //         decoration: InputDecoration(
                    //           hintText: "Select date",
                    //           hintStyle: TextStyle(
                    //             color: kPrimaryCol.withOpacity(0.5),
                    //           ),
                    //           enabledBorder: InputBorder.none,
                    //           focusedBorder: InputBorder.none,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.chevron_left),
                            onPressed: () {
                              setState(() {
                                currentDate = currentDate.subtract(
                                  Duration(days: 1),
                                );
                              });
                            },
                          ),
                          InkWell(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              setState(() {
                                currentDate = pickedDate ?? currentDate;
                              });
                            },
                            child: AbsorbPointer(
                              child: Builder(
                                builder: (context) {
                                  // Replace with your selected date logic if needed
                                  // final today = DateTime.now();
                                  final formatted = currentDate.isToday
                                      ? "Today"
                                      : currentDate.toIsoDateString();
                                  return Text(
                                    formatted,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: kPrimaryCol,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.chevron_right),
                            onPressed: () {
                              setState(() {
                                currentDate = currentDate.add(
                                  Duration(days: 1),
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
