
import 'package:flutter_project_1_0/models/list_entry.dart';

class ForumPostEntry{
  final String listEntryId;
  final String? username;
  final String date;
  final int likes;
  final int dislikes;
  final String text;

  ForumPostEntry(this.listEntryId, this.username, this.date, this.likes, this.dislikes, this.text);
}