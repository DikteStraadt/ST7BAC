import 'package:flutter_project_1_0/models/form_post_entry.dart';

class ListEntry {
  final String id;
  final String title;
  final String question;
  final String? createdBy;
  final int views;
  final int responses;
  final List<ForumPostEntry> postEntries;
  

  ListEntry(this.id, this.title, this.question, this.createdBy, this.views, this.responses, this.postEntries);
}