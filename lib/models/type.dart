class Type {
  int? id;
  String name;

  Type({
    required this.id,
    required this.name
  });

  factory Type.fromMap(Map<String,Object?> map){
    return Type(id: int.parse(map["id"].toString()), name: map["name"].toString());
  }

  Map<String,Object?> toMap(){
    return <String,Object?>{
      "id": id,
      "name":name,
    };
  }

  @override
  String toString(){
    return "Type{id: $id, name:$name}";
  }
}