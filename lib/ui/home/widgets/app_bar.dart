import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/bloc/calendar/calendar_bloc.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarBloc,CalendarState>(builder: (context, state) => Row(
      children: [
        const Spacer(),
        55.pw,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.read<CalendarBloc>().selectedWeekDay,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
                "${context.read<CalendarBloc>().selectedDay} ${context.read<CalendarBloc>().selectedMonthText} ${context.read<CalendarBloc>().year} "),
          ],
        ),
        const Spacer(),
        IconButton(
            splashRadius: 16.r,
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.notification))
      ],
    ), listener: (context, state) {
      if (state is CalendarUpdateState) {
        setState(() {});
      }
    },);
  }
}
