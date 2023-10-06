import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/to_do_model/to_do_model.dart';
import 'package:flutter_defualt_project/ui/app_routes.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomDetailAppBar extends StatelessWidget {
  const CustomDetailAppBar({super.key, required this.toDo});

  final ToDoModel toDo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 18.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r)),
          color: toDo.priority == 0
              ? AppColors.blue
              : toDo.priority == 1
                  ? AppColors.orange
                  : AppColors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          18.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ZoomTapAnimation(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: SvgPicture.asset(AppIcons.arrowBack2,width: 20.w),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.addScreen,
                    arguments: {"isEditScreen": true, "toDo": toDo},
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.edit,width: 20.w),
                    Text(
                      "Edit",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.white),
                    )
                  ],
                ),
              )
            ],
          ),
          20.ph,
          Text(
            toDo.name,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColors.white),
          ),
          Text(
            toDo.description,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          12.ph,
          Row(
            children: [
              SvgPicture.asset(AppIcons.clock,width: 20.w,),
              4.pw,
              Text(
                toDo.time,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.white),
              )
            ],
          ),
          12.ph,
          toDo.location!.isEmpty
              ? const SizedBox()
              : Row(
                  children: [
                    SvgPicture.asset(AppIcons.location,width: 20.w),
                    4.pw,
                    Text(
                      toDo.location!,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.white),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
