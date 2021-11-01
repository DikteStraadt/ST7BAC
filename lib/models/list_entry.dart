import 'package:flutter_project_1_0/models/form_post_entry.dart';

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