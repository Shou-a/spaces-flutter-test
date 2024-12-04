abstract class BaseEntity {
  BaseEntity();
  fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson() must be implemented in subclasses');
  }
}
