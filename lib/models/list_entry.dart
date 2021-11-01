class ListEntry {
  final String id;
  final String title;
  final String question;
  final String date;
  final String? createdBy;
  final int views;
  final int responses;  

  ListEntry(this.id, this.title, this.question, this.date, this.createdBy, this.views, this.responses);
}