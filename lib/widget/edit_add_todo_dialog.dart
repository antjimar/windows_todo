import 'package:fluent_ui/fluent_ui.dart';
import 'package:windows_todo/model/todo.dart';

class AddEditTodoContent extends StatefulWidget {
  const AddEditTodoContent({Key? key}) : super(key: key);

  @override
  State<AddEditTodoContent> createState() => _AddEditTodoContentState();
}

class _AddEditTodoContentState extends State<AddEditTodoContent> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  bool isFinished = false;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      title: Text('Create Todo'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBox(
            controller: titleController,
            placeholder: 'Title',
          ),
          SizedBox(
            height: 20,
          ),
          TextBox(
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            placeholder: 'Description',
          ),
          SizedBox(
            height: 20,
          ),
          Checkbox(
              content: Text('Is Finished?'),
              checked: isFinished,
              onChanged: (val) {
                setState(() {
                  isFinished = !isFinished;
                });
              })
        ],
      ),
      actions: [
        TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            }),
        TextButton(
            child: Text('Create'),
            onPressed: () {
              String title = titleController.text;
              String description = descriptionController.text;
              Todo.todoList.add(Todo(
                  title: title,
                  description: description,
                  isFinished: isFinished));
              Navigator.pop(context);
            })
      ],
    );
  }
}
