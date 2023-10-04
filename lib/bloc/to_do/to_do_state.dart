part of 'to_do_bloc.dart';

@immutable
abstract class ToDoState extends Equatable {}

class ToDoInitial extends ToDoState{
  @override
  List<Object?> get props => [];
}

class ToDoAddState extends ToDoState{
  @override
  List<Object?> get props => [];
}

class ToDoUpdateState extends ToDoState{
  @override
  List<Object?> get props => [];
}

class ToDoDeleteState extends ToDoState{
  @override
  List<Object?> get props => [];
}

class ToDoErrorState extends ToDoState{
  final String errorText;
  ToDoErrorState({required this.errorText});
  @override
  List<Object?> get props => [errorText];
}