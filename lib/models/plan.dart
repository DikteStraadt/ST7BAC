class Plan {
  
  final String user;
  final String title;
  late List<Map<String,String>> recipesList;

  Plan(this.user, this.title, this.recipesList);
}