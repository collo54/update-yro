class SpiceModel {
  final String? spice;
  final String? time;
  SpiceModel({
    this.spice,
    this.time,
  });

  factory SpiceModel.fromMap(Map<String, dynamic> data) {
    final String? spice = data['true'];
    final String? time = data['time'];

    return SpiceModel(
      spice: spice,
      time: time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "spice": spice,
      "time": time,
    };
  }
}
