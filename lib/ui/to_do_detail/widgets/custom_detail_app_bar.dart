import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomDetailAppBar extends StatelessWidget {
  const CustomDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.w,vertical: 18.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r),bottomRight: Radius.circular(20.r)),
          color: AppColors.blue
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          18.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ZoomTapAnimation(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100.r)
                  ),
                  child: SvgPicture.asset(AppIcons.arrowBack2),
                ),
              ),
              ZoomTapAnimation(
                onTap: (){},
                child: Row(
                  children: [
                    SvgPicture.asset(AppIcons.edit),
                    Text("Edit",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white),)
                  ],
                ),
              )
            ],
          ),
          20.ph,
          Text("Watching Football",style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.white),),
          Text("Manchester United vs Arsenal (Premiere League)",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.white),maxLines: 1,overflow: TextOverflow.ellipsis,),
          12.ph,
          Row(
            children: [
              SvgPicture.asset(AppIcons.clock),
              4.pw,
              Text("17:00 - 18:30",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.white),)
            ],
          ),
          12.ph,
          Row(
            children: [
              SvgPicture.asset(AppIcons.location),
              4.pw,
              Text("Stamford Bridge",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.white),)
            ],
          ),
        ],
      ),
    );
  }
}
