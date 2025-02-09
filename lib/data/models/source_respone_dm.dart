import 'source_dm.dart';

class SourceResponseDM {
  String? status;
  List<SourceDM>? sources;

  SourceResponseDM({
    this.status,
    this.sources,
  });

  SourceResponseDM.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(SourceDM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
