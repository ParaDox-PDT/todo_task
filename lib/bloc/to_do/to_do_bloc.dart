import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_defualt_project/data/local/db/local_database.dart';
import 'package:flutter_defualt_project/data/models/to_do_model/to_do_model.dart';


part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoInitial()) {
    on<AddToDoEvent>(_addToDo);
    on<UpdateToDoEvent>(_updateToDo);
    on<DeleteToDoEvent>(_deleteToDo);
    on<GetToDosEvent>(_getAllToDos);
    on<GetToDosByDateEvent>(_getToDosByDate);
  }

  List<ToDoModel> toDos=[];
  List<String> normal=[];
  List<String> urgent=[];
  List<String> veryUrgent=[];
  checkPriority({required String date}){
    normal=[];
    urgent=[];
    veryUrgent=[];
    for (var element in toDos) {
      if(element.priority==0 && element.yearMonth==date){
        normal.add(element.day);
      }else if(element.priority==1 && element.yearMonth==date){
        urgent.add(element.day);
      }else if(element.priority==2 && element.yearMonth==date){
        veryUrgent.add(element.day);
      }
    }}

  _addToDo(AddToDoEvent event,Emitter<ToDoState> emit)async{
    try{
      await LocalDatabase.insertToDo(event.newToDo);
      emit(ToDoAddState());
    }catch(e){
      emit(ToDoErrorState(errorText: e.toString()));
    }
    emit(ToDoInitial());
  }

  _updateToDo(UpdateToDoEvent event,Emitter<ToDoState> emit)async{
    try{
      await LocalDatabase.updateToDo(toDoModel: event.updatedToDo,id: event.id);
      emit(ToDoUpdateState());
    }catch(e){
      emit(ToDoErrorState(errorText: e.toString()));
    }
    emit(ToDoInitial());
  }

  _deleteToDo(DeleteToDoEvent event,Emitter<ToDoState> emit)async{
    try{
      await LocalDatabase.deleteToDo(event.id);
      emit(ToDoDeleteState());
    }catch(e){
      emit(ToDoErrorState(errorText: e.toString()));
    }
    emit(ToDoInitial());
  }
  
  _getAllToDos(GetToDosEvent event,Emitter<ToDoState> emit)async{
    try{
     toDos = await LocalDatabase.getAllToDos();
      emit(ToDoGetState());
    }catch (e){
      emit(ToDoErrorState(errorText: e.toString()));
    }
    emit(ToDoInitial());
  }

  _getToDosByDate(GetToDosByDateEvent event,Emitter<ToDoState> emit)async{
    try{
      print(event.date);
     toDos = await LocalDatabase.getToDoByDate(event.date);
     checkPriority(date: event.date);
      emit(ToDoGetState());
      emit(ToDoInitial());
    }catch (e){
      emit(ToDoErrorState(errorText: e.toString()));
    }
  }
}
