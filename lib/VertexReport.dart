class VertexReport {
  List<Predictions>? predictions;

  VertexReport({this.predictions});

  VertexReport.fromJson(Map<String, dynamic> json) {
    if (json['predictions'] != null) {
      predictions = <Predictions>[];
      json['predictions'].forEach((v) {
        predictions!.add(Predictions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (predictions != null) {
      data['predictions'] = predictions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Predictions {
  List<double>? confidences;
  List<String>? displayNames;
  List<String>? ids;

  Predictions({this.confidences, this.displayNames, this.ids});

  Predictions.fromJson(Map<String, dynamic> json) {
    confidences = json['confidences'].cast<double>();
    displayNames = json['displayNames'].cast<String>();
    ids = json['ids'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confidences'] = confidences;
    data['displayNames'] = displayNames;
    data['ids'] = ids;
    return data;
  }
}