import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/Extensions/responsive_extention.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/imports.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/strings.dart';

import 'Components/addDataForm.dart';
import 'Components/dotted_widget.dart';
import 'Components/todocontainer.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          "${AppStrings.welcome} ${Data.app.user?.name}",
          style: const TextStyle(),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Todo',
        onPressed: () {
          MethodWidgets.instance.dialog(context, child: const AddDataForm());
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              builder: (context, todoVal, oldWidget) {
                return todoVal.isEmpty
                    ? const Center(
                        child: AppText(
                          "No Item",
                          style: TextStyle(),
                        ),
                      )
                    : ListView.separated(
                                      shrinkWrap: true,
                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                        itemBuilder: (context, index) {
                          return TodoContainer(
                            todo: todoVal[index],
                            dismissedCalled: () {
                              log("called the dismissed");
                              removeItem(index);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return 20.y;
                        },
                        itemCount: todoVal.length);
              },
              valueListenable: TodoController.todoController,
            ),

            // Column(
            //   children: [
            //     Center(
            //       child: DottedBorder(
            //         color: Colors.black45,
            //         strokeWidth: 2.0,
            //         gap: 30.0,
            //         dashWidth: 30,
            //         borderRadius: 12.0,
            //         child: Container(
            //           width: 300,
            //           height: 300,
            //           color: Colors.yellow,
            //           child: const Center(
            //             child: AppText(
            //               'Dotted Border',
            //               style: TextStyle(fontSize: 18),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 300,)
          ],
        ),
      ),
    );
  }

  void removeItem(int index) {
    TodoController.todoController.value.removeAt(index);
    TodoController.todoController.notifyListeners();
  }
}
