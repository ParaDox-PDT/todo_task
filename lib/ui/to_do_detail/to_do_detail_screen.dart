import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/bloc/to_do/to_do_bloc.dart';
import 'package:flutter_defualt_project/data/models/to_do_model/to_do_model.dart';
import 'package:flutter_defualt_project/ui/to_do_detail/widgets/custom_detail_app_bar.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.toDo});
  final ToDoModel toDo;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle:  SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light,statusBarColor:widget.toDo.priority == 0
            ? AppColors.blue
            : widget.toDo.priority == 1
            ? AppColors.orange
            : AppColors.red),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         CustomDetailAppBar(toDo: widget.toDo,),
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
                    Text(widget.toDo.description,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.passiveTextColor),),
                    
                  ],
                ),
              ),
            ),
          ),
          ZoomTapAnimation(
            onTap: (){
              context.read<ToDoBloc>().add(DeleteToDoEvent(id: widget.toDo.id!));
              Navigator.pop(context);
            },
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
                  SvgPicture.asset(AppIcons.delete,width: 20.w,),
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
