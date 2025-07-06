import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:workshifts/common/constants.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}

class _HomeAppBarState extends State<HomeAppBar> {
  DateTime currentWeekStart = _getStartOfWeek(DateTime.now());

  static DateTime _getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  String _formatWeekRange(DateTime weekStart) {
    final weekEnd = weekStart.add(const Duration(days: 6));
    final today = DateTime.now();

    final normalizedToday = DateTime(today.year, today.month, today.day);

    final thisWeek =
        (normalizedToday.isAfter(weekStart.subtract(const Duration(days: 1))) &&
            normalizedToday.isBefore(weekEnd.add(const Duration(days: 1))))
        ? "This Week \n"
        : "";

    final startFormat = DateFormat('MMM d');
    final endFormatSameMonth = DateFormat('d, yyyy');
    final endFormatDifferentMonth = DateFormat('MMM d, yyyy');

    if (weekStart.month == weekEnd.month) {
      return "$thisWeek${startFormat.format(weekStart)} – ${endFormatSameMonth.format(weekEnd)}";
    } else {
      return "$thisWeek${startFormat.format(weekStart)} – ${endFormatDifferentMonth.format(weekEnd)}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final useDarkIcons = kPrimaryCol.computeLuminance() > 0.5;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: useDarkIcons
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: kToolbarHeight * 1.5,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: kToolbarHeight,
                decoration: BoxDecoration(
                  color: kPrimaryCol,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 54,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryCol.withOpacity(0.23),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.keyboard_double_arrow_left_rounded,
                              ),
                              onPressed: () {
                                setState(() {
                                  currentWeekStart = currentWeekStart.subtract(
                                    const Duration(days: 7),
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              width: 160,
                              child: Center(
                                child: Text(
                                  _formatWeekRange(currentWeekStart),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: kPrimaryCol,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.keyboard_double_arrow_right_rounded,
                              ),
                              onPressed: () {
                                setState(() {
                                  currentWeekStart = currentWeekStart.add(
                                    const Duration(days: 7),
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              currentWeekStart = _getStartOfWeek(
                                DateTime.now(),
                              );
                            });
                          },
                          icon: const Icon(Icons.restore_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
