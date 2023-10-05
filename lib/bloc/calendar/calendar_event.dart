part of 'calendar_bloc.dart';


abstract class CalendarEvent extends Equatable{}

class CalendarCheckDaysEvent extends CalendarEvent{
  @override
  List<Object?> get props => [];
}

class CalendarCheckMonthDaysEvent extends CalendarEvent{
  final int month;
  CalendarCheckMonthDaysEvent({required this.month});
  @override
  List<Object?> get props => [month];
}

class CalendarDecrementMonthEvent extends CalendarEvent{
  @override
  List<Object?> get props => [];
}

class CalendarIncrementMonthEvent extends CalendarEvent{
  @override
  List<Object?> get props => [];
}

class CalendarSelectDateEvent extends CalendarEvent{
  final int day;
  CalendarSelectDateEvent({required this.day});
  @override
  List<Object?> get props => [day];
}

