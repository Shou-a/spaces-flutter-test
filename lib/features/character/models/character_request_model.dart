class CharacterRequest {
  CharacterRequest({
    int? id,
    String? name,
    DateTime? dateFilter,
  }) {
    _id = id;
    _name = name;
    _dateFilter = dateFilter;
  }

  int? _id;
  String? _name;
  DateTime? _dateFilter;

  CharacterRequest copyWith({
    int? id,
    String? name,
    DateTime? dateFilter,
  }) =>
      CharacterRequest(
        id: id ?? _id,
        name: name ?? _name,
        dateFilter: dateFilter ?? _dateFilter,
      );

  ////  Getters
  int? get id => _id;
  String? get name => _name;
  DateTime? get dateFilter => _dateFilter;

  ////  Setters
  set id(int? value) => _id = value;
  set name(String? value) => _name = value;
  set dateFilter(DateTime? value) => _dateFilter = value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['date_filter'] = _dateFilter?.toIso8601String();
    return map;
  }
}
