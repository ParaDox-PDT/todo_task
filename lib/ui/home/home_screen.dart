import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> mon = [];
  List<String> tue = [];
  List<String> wed = [];
  List<String> thu = [];
  List<String> fri = [];
  List<String> sat = [];
  List<String> sun = [];

  List<String> weekdays = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"];
  late  List<List<String>> lists = [];
  int endDay=30;
  int month=DateTime.now().month;
  _checkMonthDays(int m){
    switch (m){
      case 1:
        endDay = 31;
        break;
      case 2:
        endDay = 28;
        break;
      case 3:
        endDay = 31;
        break;
      case 4:
        endDay = 30;
        break;
      case 5:
        endDay = 31;
        break;
      case 6:
        endDay = 30;
        break;
      case 7:
        endDay = 31;
        break;
      case 8:
        endDay = 31;
        break;
      case 9:
        endDay = 30;
        break;
      case 10:
        endDay = 31;
        break;
      case 11:
        endDay = 30;
        break;
      case 12:
        endDay = 31;
        break;
    }
  }
  _checkWeekDays(){
    mon.clear();
    tue.clear();
    wed.clear();
    thu.clear();
    fri.clear();
    sat.clear();
    sun.clear();
    for (int i = 1; i <= endDay; i++) {
      if(i==1){
        switch (DateTime.utc(2023,month,i).weekday) {
          case 1:
            break;
          case 2:
            mon.add(" ");
            break;
          case 3:
            mon.add(" ");
            tue.add(" ");
            break;
          case 4:
            mon.add(" ");
            tue.add(" ");
            wed.add(" ");
            break;
          case 5:
            mon.add(" ");
            tue.add(" ");
            wed.add(" ");
            thu.add(" ");
            break;
          case 6:
            mon.add(" ");
            tue.add(" ");
            wed.add(" ");
            thu.add(" ");
            fri.add(" ");
            break;
          case 7:
            mon.add(" ");
            tue.add(" ");
            wed.add(" ");
            thu.add(" ");
            fri.add(" ");
            sat.add(" ");
            break;
          default:
            break;
        }

      }
      if(i==endDay){
        switch (DateTime.utc(2023,month,i).weekday) {
          case 1:
            tue.add(" ");
            wed.add(" ");
            thu.add(" ");
            fri.add(" ");
            sat.add(" ");
            sun.add(" ");
            break;
          case 2:
            wed.add(" ");
            thu.add(" ");
            fri.add(" ");
            sat.add(" ");
            sun.add(" ");
            break;
          case 3:
            thu.add(" ");
            fri.add(" ");
            sat.add(" ");
            sun.add(" ");
            break;
          case 4:
            fri.add(" ");
            sat.add(" ");
            sun.add(" ");
            break;
          case 5:
            sat.add(" ");
            sun.add(" ");
            break;
          case 6:
            sun.add(" ");
            break;
          case 7:
            break;
          default:
            break;
        }

      }
      switch (DateTime.utc(2023,month,i).weekday) {
        case 1:
          mon.add(i.toString());
          break;
        case 2:
          tue.add(i.toString());
          break;
        case 3:
          wed.add(i.toString());
          break;
        case 4:
          thu.add(i.toString());
          break;
        case 5:
          fri.add(i.toString());
          break;
        case 6:
          sat.add(i.toString());
          break;
        case 7:
          sun.add(i.toString());
          break;
        default:
          break;
      }
    }
  }

  @override
  void initState() {
    lists = [mon,tue,wed,thu,fri,sat,sun];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          month.toString(),
          style: TextStyle(color: AppColors.textColor),
        ),
        actions: [
          IconButton(onPressed: (){
            if(month==1){
              month=12;
            }else{
              month=month-1;
            }
            _checkMonthDays(month);
            _checkWeekDays();
            setState(() {

            });
          }, icon:Icon(Icons.arrow_back_ios,color: Colors.black,)),
          IconButton(onPressed: (){
            if(month==12){
              month=1;

            }else{
              month=month+1;
            }
            _checkMonthDays(month);
            _checkWeekDays();
            setState(() {

            });
          }, icon:Icon(Icons.arrow_forward_ios,color: Colors.black,)),
        ],
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(weekdays.length, (i) {
                  return Column(
                    children: [
                      Text(weekdays[i],style: TextStyle(color: Colors.black),),
                      ...List.generate(lists[i].length, (index) => ZoomTapAnimation(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4.h),
                          width: 25.w,
                          height: 25.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              border: Border.all(width: 1,color: Colors.black)
                          ),
                          child: Center(
                            child: Text(
                              lists[i][index].toString(),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),)
                    ],
                  );
                }),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  _checkWeekDays();
                  setState(() {});
                },
                child: const Text("Button")),
          ],
        ),
      ),
    );
  }
}
