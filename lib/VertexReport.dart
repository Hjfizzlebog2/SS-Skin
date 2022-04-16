class VertexReport {
  List<Predictions>? predictions;

  VertexReport({this.predictions});

  VertexReport.fromJson(Map<String, dynamic> json) {
    if (json['predictions'] != null) {
      predictions = <Predictions>[];
      json['predictions'].forEach((v) {
        predictions!.add(new Predictions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.predictions != null) {
      data['predictions'] = this.predictions!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confidences'] = this.confidences;
    data['displayNames'] = this.displayNames;
    data['ids'] = this.ids;
    return data;
  }
}