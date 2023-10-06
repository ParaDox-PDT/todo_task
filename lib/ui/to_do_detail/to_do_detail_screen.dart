import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_defualt_project/ui/to_do_detail/widgets/custom_detail_app_bar.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.blue),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const CustomDetailAppBar(),
          28.ph,
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reminder",style: Theme.of(context).textTheme.titleMedium,),
                    10.ph,
                    Text("15 minutes before",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.passiveTextColor),),
                    22.ph,
                    Text("Description",style: Theme.of(context).textTheme.titleMedium,),
                    10.ph,
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vel ex sit amet neque dignissim mattis non eu est. Etiam pulvinar est mi, et porta magna accumsan nec. Ut vitae urna nisl. Integer gravida sollicitudin massa, ut congue orci posuere sit amet. Aenean laoreet egestas est, ut auctor nulla suscipit non. ",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.passiveTextColor),),
                    
                  ],
                ),
              ),
            ),
          ),
          ZoomTapAnimation(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 28.w,vertical: 6.h),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.red.withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.delete),
                  Text("Delete Event",style: Theme.of(context).textTheme.labelLarge,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
