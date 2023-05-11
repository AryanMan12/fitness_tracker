class ExerciseType {
  int? id;
  String name;

  ExerciseType({
    required this.id,
    required this.name
  });

  factory ExerciseType.fromMap(Map<String,Object?> map){
    return ExerciseType(id: int.parse(map["id"].toString()), name: map["name"].toString());
  }

  Map<String,Object?> toMap(){
    return <String,Object?>{
      "id": id,
      "name":name,
    };
  }

  @override
  String toString(){
    return "ExerciseType{id: $id, name:$name}";
  }
}