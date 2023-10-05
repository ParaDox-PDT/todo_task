import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/bloc/calendar/calendar_bloc.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_defualt_project/ui/home/widgets/app_bar.dart';
import 'package:flutter_defualt_project/ui/home/widgets/calendar.dart';
import 'package:flutter_defualt_project/ui/home/widgets/to_do_item.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<List<String>> lists = [];

  @override
  void initState() {
    lists = BlocProvider.of<CalendarBloc>(context).lists;
    BlocProvider.of<CalendarBloc>(context).add(CalendarCheckDaysEvent());
    BlocProvider.of<CalendarBloc>(context).add(CalendarCheckMonthDaysEvent(
        month: BlocProvider.of<CalendarBloc>(context).month));
    BlocProvider.of<CalendarBloc>(context)
        .add(CalendarSelectDateEvent(day: DateTime.now().day));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<CalendarBloc, CalendarState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                 const CustomAppBar(),
                  20.ph,
                  CustomCalendar(lists: lists),
                  32.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Schedule",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      ZoomTapAnimation(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.addScreen);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.w, vertical: 8.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.blue),
                          child: Center(
                            child: Text(
                              "+ Add Event",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  10.ph,
                const ToDoItem(title: "Watching Football", subTitle: "Manchester United vs Arsenal (Premiere League)", time: "17:00 - 18:30", priority: 0,location: "Stamford Bridge",),
                const ToDoItem(title: "Deadline Project UI Website", subTitle: "Profile Page, Cart, and Wishlist.", time: "21:00 - 22:30", priority: 2,),
                const ToDoItem(title: "Meeting Client (Japan)", subTitle: "Android apps and website online shop", time: "23:15 - 00:45", priority: 1,),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is CalendarUpdateState) {
            setState(() {});
          }
        },
      )),
    );
  }
}
