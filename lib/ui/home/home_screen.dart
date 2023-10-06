import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/bloc/calendar/calendar_bloc.dart';
import 'package:flutter_defualt_project/bloc/to_do/to_do_bloc.dart';
import 'package:flutter_defualt_project/data/models/to_do_model/to_do_model.dart';
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
  late List<ToDoModel> toDos;

  _init()async{
    setState(() {
      toDos=BlocProvider.of<ToDoBloc>(context).toDos;
    });
  }

  @override
  void initState() {
    lists = BlocProvider.of<CalendarBloc>(context).lists;
    BlocProvider.of<CalendarBloc>(context).add(CalendarCheckDaysEvent());
    BlocProvider.of<CalendarBloc>(context).add(CalendarCheckMonthDaysEvent(
        month: BlocProvider.of<CalendarBloc>(context).month));
    BlocProvider.of<CalendarBloc>(context)
        .add(CalendarSelectDateEvent(day: DateTime.now().day));
    BlocProvider.of<ToDoBloc>(context).add(GetToDosByDateEvent(date: "${BlocProvider.of<CalendarBloc>(context).selectedYear}/${BlocProvider.of<CalendarBloc>(context).selectedMonth}"));
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: AppColors.white),
      ),
      body: SafeArea(
          child: BlocConsumer<CalendarBloc, CalendarState>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
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
                  BlocConsumer<ToDoBloc, ToDoState>(
                    builder: (context, state) {
                      print(toDos);
                      return Column(
                        children: [
                          ...List.generate(toDos.length, (index) {
                            ToDoModel toDo = toDos[index];
                            return ToDoItem(
                                toDo: toDo,);
                          }),
                        ],
                      );
                    },
                    listener: (context, state) {
                      if(state is ToDoGetState){
                        setState(() {
                          _init();
                        });
                      }
                      if(state is ToDoAddState || state is ToDoDeleteState){
                        BlocProvider.of<ToDoBloc>(context).add(GetToDosByDateEvent(date: "${BlocProvider.of<CalendarBloc>(context).selectedYear}/${BlocProvider.of<CalendarBloc>(context).selectedMonth}"));
                        setState(() {
                          _init();
                        });
                      }
                    },
                  )
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
