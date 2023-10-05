import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/ui/to_do_add/widgets/location_textfield.dart';
import 'package:flutter_defualt_project/ui/to_do_add/widgets/text_field.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();
  TextEditingController descriptionController = TextEditingController();
  FocusNode descriptionFocus = FocusNode();
  TextEditingController locationController = TextEditingController();
  FocusNode locationFocus = FocusNode();
  TextEditingController timeController = TextEditingController();
  FocusNode timeFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.gray_900,
              size: 30.sp,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    CustomTextField(
                      title: "Event name",
                      controller: nameController,
                      focusNode: nameFocus,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                    ),
                    16.ph,
                    CustomTextField(
                      title: "Event description",
                      controller: descriptionController,
                      focusNode: descriptionFocus,
                      maxLines: 6,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                    ),
                    16.ph,
                    LocationTextField(
                      title: "Event location",
                      controller: locationController,
                      focusNode: locationFocus,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                    ),
                    16.ph,
                    CustomTextField(
                      title: "Event time",
                      controller: timeController,
                      focusNode: timeFocus,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ZoomTapAnimation(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(8.r)),
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: Center(
                child: Text(
                  "Add",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
