import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/to_do_model/to_do_model.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem(
      {super.key, required this.toDo});

  final ToDoModel toDo;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: (){
        Navigator.pushNamed(context, RouteNames.detailScreen,arguments: toDo);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 12.h,
              decoration: BoxDecoration(
                  color:toDo.priority == 0
                      ? AppColors.blue
                      : toDo.priority == 1
                          ? AppColors.orange
                          : AppColors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r))),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                  color:toDo.priority == 0
                      ? AppColors.blue.withOpacity(0.2)
                      : toDo.priority == 1
                          ? AppColors.orange.withOpacity(0.2)
                          : AppColors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    toDo.name,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: toDo.priority == 0
                            ? AppColors.blueTextColor
                            : toDo.priority == 1
                                ? AppColors.orangeTextColor
                                : AppColors.redTextColor,
                        fontSize: 16.sp),
                  ),
                  Text(
                    toDo.description,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: toDo.priority == 0
                            ? AppColors.blueTextColor
                            : toDo.priority == 1
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
                            toDo.priority == 0
                                ? AppColors.blueTextColor
                                : toDo.priority == 1
                                    ? AppColors.orangeTextColor
                                    : AppColors.redTextColor,
                            BlendMode.srcIn),
                      ),
                      4.pw,
                      Text(
                        toDo.time,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: toDo.priority == 0
                                ? AppColors.blueTextColor
                                : toDo.priority == 1
                                    ? AppColors.orangeTextColor
                                    : AppColors.redTextColor),
                      ),
                      10.pw,
                      toDo.location!.isEmpty
                          ? const SizedBox()
                          : SvgPicture.asset(
                              AppIcons.location,
                              colorFilter: ColorFilter.mode(
                                  toDo.priority == 0
                                      ? AppColors.blueTextColor
                                      : toDo.priority == 1
                                          ? AppColors.orangeTextColor
                                          : AppColors.redTextColor,
                                  BlendMode.srcIn),
                            ),
                      4.pw,
                      toDo.location!.isEmpty
                          ? const SizedBox()
                          : Text(
                        toDo.location!,
                              style:
                                  Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: toDo.priority == 0
                                          ? AppColors.blueTextColor
                                          : toDo.priority == 1
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
