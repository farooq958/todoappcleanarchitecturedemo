import 'dart:developer';

import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/strings.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Domain/Model/todomodel.dart';

import 'Components/addDataForm.dart';
import 'Components/todocontainer.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(title:  AppText("${AppStrings.welcome} ${Data.app.user?.name}", style: const TextStyle(),),centerTitle: true,),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Todo',
        onPressed: () {


MethodWidgets.instance.dialog(context, child: const AddDataForm());


      },
        child: const Icon(Icons.add),),
      body: Column(children: [


Expanded(
  child: ValueListenableBuilder(
    builder: (context,todoVal,oldWidget) {
      return
        todoVal.isEmpty?const Center(child: AppText("No Item",style: TextStyle(),),) :
        ListView.separated(itemBuilder: (context,index){
  
  return TodoContainer(todo:todoVal[index],dismissedCalled: (){
log("called the dismissied");
    removeItem(index);

  },);

      }, separatorBuilder: (context,index){
  
        return 20.y;
      }, itemCount: todoVal.length);
    }, valueListenable:  TodoController.todoController,
  ),
)


      ],) ,


    );
  }

  void removeItem(int index) {
    TodoController.todoController.value.removeAt(index);
    TodoController.todoController.notifyListeners();

  }
}
