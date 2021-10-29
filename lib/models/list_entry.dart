import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project_1_0/models/form_post_entry.dart';

class ListEntry {
  final String title;
  final String question;
  final User createdBy;
  final int views;
  final int responses;
  final List<ForumPostEntry> postEntries;

  ListEntry(this.title, this.question, this.createdBy, this.views, this.responses, this.postEntries);
}