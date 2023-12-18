enum status {
  NotStarted('Not started'),
  InProgress('In Progress'),
  Done('Done');
  const status(this.value);
  final String value;
}