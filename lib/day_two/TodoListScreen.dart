import 'package:flutter/material.dart';

import 'TodoModel.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoModel> _list = todoList;
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addNewTodo(String todoName) {
    if (todoName.isEmpty) {
      return;
    }
    setState(() {
      TodoModel model = TodoModel(title: todoName);
      _list.add(model);
    });
  }

  void _pressAddTodo() async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(20.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                controller: _controller,
                autofocus: true,
                decoration: new InputDecoration(
                  labelText: 'Create new task',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
            child: const Text('OK'),
            onPressed: () {
              String todoName = _controller.text;
              Navigator.pop(context);
              _controller.text = '';
              _addNewTodo(todoName);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Tasks",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            TodoModel item = _list[index];
            return TodoItem(
              item: item,
              onTapDone: (value) {
                setState(() {
                  _list[index].isDone = value;
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pressAddTodo,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class TodoItem extends StatelessWidget {
  final TodoModel item;
  final Function onTapDone;

  const TodoItem({@required this.item, @required this.onTapDone});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapDone(!item.isDone),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 0.5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 8,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                    fontSize: 17.0,
                    color: item.isDone ? Colors.grey : Colors.black,
                    decoration: item.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
            CircleCheckbox(
              value: item.isDone,
              onChanged: onTapDone,
              activeColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}

// https://stackoverflow.com/questions/52326268/how-to-create-a-round-checkbox-in-flutter-or-change-the-checkboxs-style-suc
class CircleCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color checkColor;
  final bool tristate;
  final MaterialTapTargetSize materialTapTargetSize;

  const CircleCheckbox({
    Key key,
    @required this.value,
    this.tristate = false,
    @required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.materialTapTargetSize,
  })  : assert(tristate != null),
        assert(tristate || value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: Checkbox.width,
        height: Checkbox.width,
        child: Container(
          decoration: new BoxDecoration(
            border: Border.all(
                width: 2,
                color: Theme.of(context).unselectedWidgetColor ??
                    Theme.of(context).disabledColor),
            borderRadius: new BorderRadius.circular(100),
          ),
          child: Checkbox(
            value: value,
            tristate: tristate,
            onChanged: onChanged,
            activeColor: activeColor,
            checkColor: checkColor,
            materialTapTargetSize: materialTapTargetSize,
          ),
        ),
      ),
    );
  }
}
