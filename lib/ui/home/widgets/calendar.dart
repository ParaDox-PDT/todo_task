import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/bloc/calendar/calendar_bloc.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({super.key, required this.lists});
  final List<List<String>> lists;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "${context.read<CalendarBloc>().monthText} ${context.read<CalendarBloc>().year}",
              style: TextStyle(color: AppColors.textColor),
            ),
            const Spacer(),
            IconButton(
              splashRadius: 16.r,
              onPressed: () {
                context
                    .read<CalendarBloc>()
                    .add(CalendarDecrementMonthEvent());
              },
              icon: Container(
                width: 25.w,
                height: 25.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.c_EFEFEF),
                child: Center(
                  child: SvgPicture.asset(AppIcons.arrowBack),
                ),
              ),
            ),
            IconButton(
              splashRadius: 16.r,
              onPressed: () {
                context
                    .read<CalendarBloc>()
                    .add(CalendarIncrementMonthEvent());
              },
              icon: Container(
                width: 25.w,
                height: 25.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.c_EFEFEF),
                child: Center(
                  child: SvgPicture.asset(AppIcons.arrowNext),
                ),
              ),
            ),
          ],
        ),
        20.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(
                context.read<CalendarBloc>().weekdays.length, (i) {
              return Column(
                children: [
                  Text(
                    context.read<CalendarBloc>().weekdays[i],
                    style: const TextStyle(color: Colors.black),
                  ),
                  ...List.generate(
                    lists[i].length,
                        (index) => ZoomTapAnimation(
                      onTap: () {
                        context.read<CalendarBloc>().add(
                            CalendarSelectDateEvent(
                                day: int.parse(lists[i][index])));
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 4.h,
                            ),
                            width: 35.w,
                            height: 35.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(100.r),
                                color: context.read<CalendarBloc>().month ==
                                    context
                                        .read<CalendarBloc>()
                                        .selectedMonth &&
                                    context.read<CalendarBloc>().year ==
                                        context
                                            .read<CalendarBloc>()
                                            .selectedYear &&
                                    lists[i][index] ==
                                        context
                                            .read<CalendarBloc>()
                                            .selectedDay
                                            .toString()
                                    ? AppColors.blue
                                    : AppColors.white,
                                border: Border.all(
                                    width: 2,
                                    color: context.read<CalendarBloc>().month ==
                                        DateTime.now()
                                            .month &&
                                        context.read<CalendarBloc>().year ==
                                            DateTime.now().year &&
                                        lists[i][index] == DateTime.now().day.toString()
                                        ? AppColors.blue
                                        : AppColors.white)),
                            child: Center(
                              child: Text(
                                lists[i][index].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                  color:
                                  context
                                      .read<
                                      CalendarBloc>()
                                      .month ==
                                      context
                                          .read<
                                          CalendarBloc>()
                                          .selectedMonth &&
                                      context
                                          .read<
                                          CalendarBloc>()
                                          .year ==
                                          context
                                              .read<
                                              CalendarBloc>()
                                              .selectedYear &&
                                      lists[i][index] ==
                                          context
                                              .read<
                                              CalendarBloc>()
                                              .selectedDay
                                              .toString()
                                      ? AppColors.white
                                      : AppColors.textColor,
                                ),
                              ),
                            ),
                          ),
                          lists[i][index] == " "
                              ? SizedBox(
                            height: 6.w,
                          )
                              : Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.blueEllipse,
                                width: 6.w,
                              ),
                              4.pw,
                              SvgPicture.asset(
                                  AppIcons.orangeEllipse,
                                  width: 6.w),
                              4.pw,
                              SvgPicture.asset(
                                  AppIcons.redEllipse,
                                  width: 6.w),
                            ],
                          ),
                          10.ph
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
          ],
        ),
      ],
    );
  }
}
