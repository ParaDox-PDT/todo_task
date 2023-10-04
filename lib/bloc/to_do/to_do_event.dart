part of 'to_do_bloc.dart';

@immutable
abstract class ToDoEvent extends Equatable{}

class AddToDo extends ToDoEvent {
  final ToDoModel newToDo;

  AddToDo({required this.newToDo});

  @override
  List<Object?> get props => [newToDo];
}

class GetToDos extends ToDoEvent {
  @override
  List<Object?> get props => [];
}

class UpdateToDo extends ToDoEvent {
  final ToDoModel updatedToDo;
  final int id;

  UpdateToDo({required this.updatedToDo,required this.id});

  @override
  List<Object?> get props => [updatedToDo,id];
}

class DeleteToDo extends ToDoEvent {
  final int id;

  DeleteToDo({required this.id});

  @override
  List<Object?> get props => [id];
}
