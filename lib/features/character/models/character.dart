import '../../../core/api/base_models/base_entity_enforce.dart';

class Character extends BaseEntity {
  Character({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Origin? origin,
    Location? location,
    String? avatar,
    List<String>? episodes,
    String? url,
    DateTime? createdAt,
  }) {
    _id = id;
    _name = name;
    _status = status;
    _species = species;
    _type = type;
    _gender = gender;
    _origin = origin;
    _location = location;
    _avatar = avatar;
    _episodes = episodes;
    _url = url;
    _createdAt = createdAt;
  }

  Character.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _status = json['status'];
    _species = json['species'];
    _type = json['type'];
    _gender = json['gender'];
    _origin = json['origin'] != null ? Origin.fromJson(json['origin']) : null;
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _avatar = json['image'];
    _episodes = List<String>.from(json['episode'] ?? []);
    _url = json['url'];
    _createdAt = json['created'] != null
        ? DateTime.tryParse(json['created']) ?? null
        : null;
  }

  int? _id;
  String? _name;
  String? _status;
  String? _species;
  String? _type;
  String? _gender;
  Origin? _origin;
  Location? _location;
  String? _avatar;
  List<String>? _episodes;
  String? _url;
  DateTime? _createdAt;

  Character copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
    Origin? origin,
    Location? location,
    String? avatar,
    List<String>? episodes,
    String? url,
    DateTime? createdAt,
  }) =>
      Character(
        id: id ?? _id,
        name: name ?? _name,
        status: status ?? _status,
        species: species ?? _species,
        type: type ?? _type,
        gender: gender ?? _gender,
        origin: origin ?? _origin,
        location: location ?? _location,
        avatar: avatar ?? _avatar,
        episodes: episodes ?? _episodes,
        url: url ?? _url,
        createdAt: createdAt ?? _createdAt,
      );

  int? get id => _id;
  String? get name => _name;
  String? get status => _status;
  String? get species => _species;
  String? get type => _type;
  String? get gender => _gender;
  Origin? get origin => _origin;
  Location? get location => _location;
  String? get avatar => _avatar;
  List<String>? get episodes => _episodes;
  String? get url => _url;
  DateTime? get createdAt => _createdAt;

  set id(int? value) => _id = value;
  set name(String? value) => _name = value;
  set status(String? value) => _status = value;
  set species(String? value) => _species = value;
  set type(String? value) => _type = value;
  set gender(String? value) => _gender = value;
  set origin(Origin? value) => _origin = value;
  set location(Location? value) => _location = value;
  set avatar(String? value) => _avatar = value;
  set episodes(List<String>? value) => _episodes = value;
  set url(String? value) => _url = value;
  set createdAt(DateTime? value) => _createdAt = value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['status'] = _status;
    map['species'] = _species;
    map['type'] = _type;
    map['gender'] = _gender;
    map['origin'] = _origin?.toJson();
    map['location'] = _location?.toJson();
    map['image'] = _avatar;
    map['episode'] = _episodes;
    map['url'] = _url;
    map['created'] = _createdAt?.toIso8601String();
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Character &&
          runtimeType == other.runtimeType &&
          _id == other._id &&
          _name == other._name &&
          _status == other._status &&
          _species == other._species &&
          _type == other._type &&
          _gender == other._gender &&
          _origin == other._origin &&
          _location == other._location &&
          _avatar == other._avatar &&
          _episodes == other._episodes &&
          _url == other._url &&
          _createdAt == other._createdAt;

  @override
  int get hashCode =>
      _id.hashCode ^
      _name.hashCode ^
      _status.hashCode ^
      _species.hashCode ^
      _type.hashCode ^
      _gender.hashCode ^
      _origin.hashCode ^
      _location.hashCode ^
      _avatar.hashCode ^
      _episodes.hashCode ^
      _url.hashCode ^
      _createdAt.hashCode;
}

class Origin {
  Origin({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}

class Location {
  Location({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
