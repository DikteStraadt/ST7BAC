class User {
  
  final String? id;
  String? name;

  User.fromJson(this.id, Map data){
    name = data['name'];
    if(name == null){
      name = '';
    }
  }
}