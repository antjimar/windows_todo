import 'package:fluent_ui/fluent_ui.dart';
import 'package:windows_todo/widget/edit_add_todo_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: _getAppBar(),
      pane: _getNavigationPane(),
      content: _getNavigationBody(),
    );
  }

  _getAppBar() {
    return NavigationAppBar(
      title: Text(
        'Todo App',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: Row(
        children: [
          Spacer(),
          Align(
              alignment: Alignment.centerRight,
              child:
                  OutlinedButton(child: Text('Create Todo'), onPressed: () {
                    showDialog(context: context, builder: (cts) {
                      return AddEditTodoContent();
                    });
                  })),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }

  _getNavigationPane() {
    return NavigationPane(
        header: FlutterLogo(
          style: FlutterLogoStyle.horizontal,
          size: 100,
        ),
        selected: selectedIndex,
        onChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          PaneItem(
              icon: Icon(FluentIcons.to_do_logo_outline),
              title: Text('Todo List')),
          PaneItem(icon: Icon(FluentIcons.settings), title: Text('Settings')),
        ]);
  }

  _getNavigationBody() {
    return NavigationBody(
      index: selectedIndex,
      children: [
        Container(
          child: Center(
            child: Text('To Do List'),
          ),
        ),
        Container(
          child: Center(
            child: Text('Settings'),
          ),
        ),
      ],
    );
  }
}
