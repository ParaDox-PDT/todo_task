import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPopUpMenu extends StatelessWidget {
  const CustomPopUpMenu({super.key, required this.v, required this.onSelected});

  final int v;
  final ValueChanged onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Container(
                width: 24.w,
                height: 20.h,
                color: AppColors.blue.withOpacity(0.2),
              ),
              10.pw,
              Text(
                "Normal",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Container(
                width: 24.w,
                height: 20.h,
                color: AppColors.orange.withOpacity(0.2),
              ),
              10.pw,
              Text(
                "Urgent",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            children: [
              Container(
                width: 24.w,
                height: 20.h,
                color: AppColors.red.withOpacity(0.2),
              ),
              10.pw,
              Text(
                "Very Urgent",
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ],
      onSelected: onSelected,
      child: Container(
        width: 80.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.gray_100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 24.w,
              height: 20.h,
              color: v == 1
                  ? AppColors.blue.withOpacity(0.2)
                  : v == 2
                      ? AppColors.orange.withOpacity(0.2)
                      : AppColors.red.withOpacity(0.2),
            ),
            SvgPicture.asset(
              AppIcons.arrowDown2,
            )
          ],
        ),
      ),
    );
  }
}
