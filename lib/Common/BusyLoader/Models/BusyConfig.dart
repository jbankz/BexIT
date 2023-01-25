class BusyConfig<T> {
  final String title;
  final Future<T> awaitingTask;
  final Function(dynamic response) callback;

  BusyConfig(
      {required this.title,
      required this.awaitingTask,
      required this.callback});
}
