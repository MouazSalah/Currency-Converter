enum VehicleStatus {
  catalog(1),
  newStatus(2),
  used(3),
  all(4);

  final int value;

  const VehicleStatus(this.value);

  String get name => toString().split('.').last;

  static VehicleStatus fromValue(int value) {
    for (var type in VehicleStatus.values) {
      if (type.value == value) {
        return type;
      }
    }
    return VehicleStatus.all;
  }
}
