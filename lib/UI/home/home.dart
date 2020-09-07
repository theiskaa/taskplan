import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:todo/UI/responsive/responsive_widget.dart';
import 'package:todo/UI/widgets/alert_buttons.dart';
import 'package:todo/UI/widgets/custom_appbar.dart';
import 'package:todo/UI/widgets/custom_textField.dart';
import 'package:todo/UI/widgets/fab_buttons.dart';
import 'package:todo/UI/widgets/logout_button.dart';
import 'package:todo/UI/widgets/task_buttons.dart';
import 'package:todo/UI/widgets/task_card.dart';
import 'package:todo/model/task.dart';
import 'package:todo/services/auth_service.dart';
import 'package:todo/services/db_helper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var desController = TextEditingController();
  var db = DbHelper();
  int taskCount = 0;
  List<Task> tasks;

  @override
  void initState() {
    getTasks();
    super.initState();
  }

  getTasks() async {
    var tasksFeature = db.getTasks();
    tasksFeature.then(
      (val) {
        setState(() {
          this.tasks = val;
          taskCount = val.length;
        });
      },
    );
  }

  void deleteTask(int id) async {
    await db.delete(id);
    setState(() {
      getTasks();
    });
    Navigator.pop(context);
  }

  void saveTask() async {
    await db.insert(
      Task(
        name: titleController.text,
        description: desController.text,
      ),
    );
    setState(() {
      getTasks();
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      fab: buildFab(),
      appbar: buildCustomAppBar(),
      builder: (context, constraints) {
        return buildBody();
      },
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: taskCount,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: FocusedMenuHolder(
              onPressed: () {},
              menuItems: [
                FocusedMenuItem(
                  backgroundColor: Colors.white,
                  trailingIcon: Icon(Icons.edit, color: Color(0xff080808)),
                  title: Text(
                    "Edit",
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
              child: TaskCard(
                title: tasks[index].name,
                description: tasks[index].description,
                onPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: Text(
                          'Delete Task',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          'Are you sure you wanna to delete?',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        actions: [
                          AlertButtonClose(
                            onPress: () => Navigator.pop(context),
                            title: 'Cancel',
                          ),
                          AlertButton(
                            title: 'Delete',
                            onPress: () => deleteTask(tasks[index].id),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  FAB buildFab() {
    return FAB(
      onPress: () {
        buildAddTaskBottomSheet();
      },
    );
  }

  Future buildAddTaskBottomSheet() {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 700,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5),
                Divider(
                  thickness: 3,
                  indent: 100,
                  endIndent: 100,
                  color: Color(0xff333333),
                ),
                SizedBox(height: 20),
                taskFields(),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TaskButtonClose(
                      title: 'Close',
                      onPress: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 30),
                    TaskButtonSave(
                      title: 'Save',
                      onPress: () => saveTask(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container taskFields() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTxTFieldForAddTask(
              txtContoller: titleController,
              hint: 'Title',
            ),
            SizedBox(
              height: 10,
            ),
            CustomTxTFieldForAddTaskDes(
              txtContoller: desController,
              hint: 'Description',
            ),
          ],
        ),
      ),
    );
  }

  CustomAppBar buildCustomAppBar() {
    return CustomAppBar(
      height: 200,
      color: Color(0xff312E33),
      onPress: () {
        buildSettingsBottomSheet();
      },
      title: 'Home',
    );
  }

  Future buildSettingsBottomSheet() {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            children: [
              SizedBox(height: 5),
              Divider(
                thickness: 3,
                indent: 100,
                endIndent: 100,
                color: Color(0xff333333),
              ),
              SizedBox(height: 20),
              LogoutButton(
                onPress: () {
                  Navigator.pop(context);
                  buildSettingsShowDialog(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future buildSettingsShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Logout',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you wanna to logout?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            AlertButtonClose(
              onPress: () => Navigator.pop(context),
              title: 'Cancel',
            ),
            AlertButton(
              title: 'Logout',
              onPress: () async {
                await _auth.singOut();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
