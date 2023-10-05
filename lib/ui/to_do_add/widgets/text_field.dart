import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.title, required this.controller, required this.focusNode, this.maxLines, required this.textInputAction, required this.textInputType, this.maskFormatter});
  final String title;
  final TextEditingController controller;
  final FocusNode focusNode;
  final int? maxLines;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextInputFormatter? maskFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: Theme.of(context).textTheme.bodyMedium,),
        4.ph,
        TextField(
          cursorColor: AppColors.gray_900,
          controller: controller,
          focusNode: focusNode,
          maxLines: maxLines ?? 1,
          inputFormatters:maskFormatter !=null ? [maskFormatter!] : [],
          textInputAction: textInputAction,
          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12.w),
            filled: true,
            fillColor: AppColors.gray_100,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(width: 1,color: AppColors.gray_900)
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(width: 0,color: AppColors.gray_100)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(width: 0,color: AppColors.gray_100)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(width: 0,color: AppColors.red)

            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(width: 0,color: AppColors.gray_100)

            ),
          ),
        )
      ],
    );
  }
}
