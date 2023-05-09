class Exercise {
  int id;
  String name;
  int typeId;

  Exercise({
    required this.id,
    required this.name,
    required this.typeId,
  });

  factory Exercise.fromMap(Map<String,Object?> map){
    return Exercise(id: int.parse(map["id"].toString()), name: map["name"].toString(),typeId: int.parse(map["Type_id"].toString()));
  }

  Map<String,Object?> toMap(){
    return <String,Object?>{
      "id": id,
      "name":name,
      "typeId": typeId,
    };
  }

  @override
  String toString(){
    return "Exercise{id: $id, name:$name, typeId: $typeId}";
  }
}