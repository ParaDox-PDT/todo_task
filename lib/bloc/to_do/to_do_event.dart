part of 'to_do_bloc.dart';


abstract class ToDoEvent extends Equatable{}

class AddToDoEvent extends ToDoEvent {
  final ToDoModel newToDo;

  AddToDoEvent({required this.newToDo});

  @override
  List<Object?> get props => [newToDo];
}

class GetToDosEvent extends ToDoEvent {
  @override
  List<Object?> get props => [];
}

class GetToDosByDateEvent extends ToDoEvent {
  final String date;
  GetToDosByDateEvent({required this.date});
  @override
  List<Object?> get props => [date];
}

class UpdateToDoEvent extends ToDoEvent {
  final ToDoModel updatedToDo;
  final int id;

  UpdateToDoEvent({required this.updatedToDo,required this.id});

  @override
  List<Object?> get props => [updatedToDo,id];
}

class DeleteToDoEvent extends ToDoEvent {
  final int id;

  DeleteToDoEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
