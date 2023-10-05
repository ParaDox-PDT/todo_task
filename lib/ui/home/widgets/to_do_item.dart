import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.time,
      this.location,
      required this.priority});

  final String title;
  final String subTitle;
  final String time;
  final String? location;
  final int priority;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: (){
        Navigator.pushNamed(context, RouteNames.detailScreen);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 12.h,
              decoration: BoxDecoration(
                  color: priority == 0
                      ? AppColors.blue
                      : priority == 1
                          ? AppColors.orange
                          : AppColors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r))),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                  color: priority == 0
                      ? AppColors.blue.withOpacity(0.2)
                      : priority == 1
                          ? AppColors.orange.withOpacity(0.2)
                          : AppColors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   title,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: priority == 0
                            ? AppColors.blueTextColor
                            : priority == 1
                                ? AppColors.orangeTextColor
                                : AppColors.redTextColor,
                        fontSize: 16.sp),
                  ),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: priority == 0
                            ? AppColors.blueTextColor
                            : priority == 1
                                ? AppColors.orangeTextColor
                                : AppColors.redTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  12.ph,
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.clock,
                        colorFilter: ColorFilter.mode(
                            priority == 0
                                ? AppColors.blueTextColor
                                : priority == 1
                                    ? AppColors.orangeTextColor
                                    : AppColors.redTextColor,
                            BlendMode.srcIn),
                      ),
                      4.pw,
                      Text(
                        time,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: priority == 0
                                ? AppColors.blueTextColor
                                : priority == 1
                                    ? AppColors.orangeTextColor
                                    : AppColors.redTextColor),
                      ),
                      10.pw,
                      location == null
                          ? const SizedBox()
                          : SvgPicture.asset(
                              AppIcons.location,
                              colorFilter: ColorFilter.mode(
                                  priority == 0
                                      ? AppColors.blueTextColor
                                      : priority == 1
                                          ? AppColors.orangeTextColor
                                          : AppColors.redTextColor,
                                  BlendMode.srcIn),
                            ),
                      4.pw,
                      location == null
                          ? const SizedBox()
                          : Text(
                              location!,
                              style:
                                  Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: priority == 0
                                          ? AppColors.blueTextColor
                                          : priority == 1
                                              ? AppColors.orangeTextColor
                                              : AppColors.redTextColor),
                            ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
