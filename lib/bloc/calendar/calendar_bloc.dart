import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<CalendarCheckDaysEvent>(_checkWeekDays);
    on<CalendarCheckMonthDaysEvent>(_checkMonthDays);
    on<CalendarDecrementMonthEvent>(_decrementMonth);
    on<CalendarIncrementMonthEvent>(_incrementMonth);
    on<CalendarSelectDateEvent>(_selectDate);
  }
  List<String> mon = [];
  List<String> tue = [];
  List<String> wed = [];
  List<String> thu = [];
  List<String> fri = [];
  List<String> sat = [];
  List<String> sun = [];

  List<String> weekdays = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"];

  late  List<List<String>> lists = [mon,tue,wed,thu,fri,sat,sun];

  int endDay=30;
  String monthText="";
  int day = DateTime.now().day;
  int month=DateTime.now().month;
  int year = DateTime.now().year;

  int selectedDay = DateTime.now().day;
  int selectedMonth=DateTime.now().month;
  String selectedMonthText="";
  int selectedYear = DateTime.now().year;
  String selectedWeekDay="";

  _selectDate(CalendarSelectDateEvent event, Emitter<CalendarState> emit){
    selectedDay =event.day;
    selectedMonth = month;
    selectedMonthText = monthText;
    selectedYear = year;
    switch (DateTime.utc(year,month,event.day).weekday) {
      case 1:
        selectedWeekDay="Monday";
        break;
      case 2:
        selectedWeekDay="Tuesday";
        break;
      case 3:
        selectedWeekDay="Wednesday";
        break;
      case 4:
        selectedWeekDay="Thursday";
        break;
      case 5:
        selectedWeekDay="Friday";
        break;
      case 6:
        selectedWeekDay="Saturday";
        break;
      case 7:
        selectedWeekDay="Sunday";
        break;
      default:
        break;
    }
    emit(CalendarUpdateState());
    emit(CalendarInitial());
  }


  _checkMonthDays(CalendarCheckMonthDaysEvent event,Emitter<CalendarState> emit){
    switch (event.month){
      case 1:
        monthText="January";
        endDay = 31;
        break;
      case 2:
        if(year%400==0 || (year%4==0 && year%100!=0)){
          endDay = 29;
        }else{
          endDay = 28;
        }
        monthText="February";
        break;
      case 3:
        monthText="March";
        endDay = 31;
        break;
      case 4:
        monthText="April";
        endDay = 30;
        break;
      case 5:
        monthText="May";
        endDay = 31;
        break;
      case 6:
        monthText="June";
        endDay = 30;
        break;
      case 7:
        monthText="July";
        endDay = 31;
        break;
      case 8:
        monthText="August";
        endDay = 31;
        break;
      case 9:
        monthText="September";
        endDay = 30;
        break;
      case 10:
        monthText="October";
        endDay = 31;
        break;
      case 11:
        monthText="November";
        endDay = 30;
        break;
      case 12:
        monthText="December";
        endDay = 31;
        break;
    }
    emit(CalendarUpdateState());
    emit(CalendarInitial());
  }

  _checkWeekDays(CalendarCheckDaysEvent event,Emitter<CalendarState> emit){
    mon.clear();
    tue.clear();
    wed.clear();
    thu.clear();
    fri.clear();
    sat.clear();
    sun.clear();
    for (int i = 1; i <= endDay; i++) {
      if(i==1){
        switch (DateTime.utc(year,month,i).weekday) {
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
        switch (DateTime.utc(year,month,i).weekday) {
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
      switch (DateTime.utc(year,month,i).weekday) {
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
    emit(CalendarUpdateState());
    emit(CalendarInitial());
  }

  _incrementMonth(CalendarIncrementMonthEvent event,Emitter<CalendarState> emit){
    if(month==12){
      year=year+1;
      month=1;
    }else{
      month=month+1;
    }
    _checkMonthDays(CalendarCheckMonthDaysEvent(month: month),emit);
    _checkWeekDays(CalendarCheckDaysEvent(),emit);
    emit(CalendarUpdateState());
    emit(CalendarInitial());
  }

  _decrementMonth(CalendarDecrementMonthEvent event,Emitter<CalendarState> emit){
    if(month==1){
      year=year-1;
      month=12;
    }else{
      month=month-1;
    }
    _checkMonthDays(CalendarCheckMonthDaysEvent(month: month),emit);
    _checkWeekDays(CalendarCheckDaysEvent(),emit);
    emit(CalendarUpdateState());
    emit(CalendarInitial());
  }

}
