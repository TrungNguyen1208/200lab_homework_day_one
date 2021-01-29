
class TodoModel {

  String title;
  bool isDone;

  TodoModel({this.title, this.isDone = false});
}

final todoList = [
  TodoModel(
    title: "Create new project"
  ),
  TodoModel(
      title: "Working call"
  ),
  TodoModel(
      title: "Meet with color"
  ),
  TodoModel(
      title: "Go to the shop", isDone: true
  ),
  TodoModel(
      title: "Walk with dog", isDone: true
  ),
];