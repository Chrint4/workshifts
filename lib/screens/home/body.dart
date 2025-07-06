import 'package:flutter/material.dart';
import 'package:workshifts/common/constants.dart';
import 'package:workshifts/common/extensions.dart';
import 'package:workshifts/screens/home/header_with_search.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        // HeaderWithSearchBox(size: size),
        Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding * 2),
          child: Column(
            spacing: kDefaultPadding / 2,
            children: List.generate(7, (index) => DayCard(index: index)),
          ),
        ),

        // const SizedBox(height: kDefaultPadding * 1),

        // Expanded(
        //   child: Stack(
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(color: kPrimaryCol),
        //         child: Center(
        //           child: Text(
        //             'Bottom Bar',
        //             style: TextStyle(
        //               color: kBackgroundCol,
        //               fontSize: 18,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //         ),
        //       ),
        //       Positioned(
        //         top: -20,
        //         left: 0,
        //         right: 0,
        //         child: Container(
        //           height: 40,
        //           decoration: BoxDecoration(
        //             color: kBackgroundCol,
        //             borderRadius: BorderRadius.circular(20),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class DayCard extends StatelessWidget {
  const DayCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: index.isEven ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryCol,
          borderRadius: BorderRadius.only(
            topRight: index.isOdd ? Radius.zero : Radius.circular(20),
            bottomRight: index.isOdd ? Radius.zero : Radius.circular(20),
            topLeft: index.isEven ? Radius.zero : Radius.circular(20),
            bottomLeft: index.isEven ? Radius.zero : Radius.circular(20),
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: index.isEven
              ? [
                  CardShortDayDisplay(index: index),

                  VerticalSpacerLine(
                    width: 1,
                    height: kCardHeight,
                    amount: 0.8,
                  ),
                  DayCardTimeSection(),
                ]
              : [
                  DayCardTimeSection(),
                  VerticalSpacerLine(
                    width: 1,
                    height: kCardHeight,
                    amount: 0.8,
                  ),
                  CardShortDayDisplay(index: index),
                ],
        ),
      ),
    );
  }
}

class DayCardTimeSection extends StatelessWidget {
  const DayCardTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      child: Row(
        spacing: kDefaultPadding / 2,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Column(
            spacing: kDefaultPadding / 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "AM",
                style: TextStyle(
                  color: kBackgroundCol,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                spacing: kDefaultPadding / 4,
                children: [
                  ShiftTimeBox(label: "10:30"),
                  ShiftTimeBox(label: "11:30"),
                ],
              ),
            ],
          ),
          // Spacer between AM and PM
          VerticalSpacerLine(
            width: 1,
            height: kCardHeight - kDefaultPadding,
            amount: 0.8,
          ),
          // PM Shift
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: kDefaultPadding / 4,
            children: [
              Text(
                "PM",
                style: TextStyle(
                  color: kBackgroundCol,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                spacing: kDefaultPadding / 4,
                children: [
                  ShiftTimeBox(label: "15:00"),
                  ShiftTimeBox(label: "19:30"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardShortDayDisplay extends StatelessWidget {
  const CardShortDayDisplay({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: Text(
        kWeek[index].short,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kBackgroundCol,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Dummy ShiftTimeBox widget for demonstration; replace with your actual implementation if needed.
class ShiftTimeBox extends StatelessWidget {
  final String label;
  const ShiftTimeBox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: TextStyle(color: kBackgroundCol, fontSize: 14)),
    );
  }
}
