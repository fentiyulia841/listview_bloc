class WilayahModel {

  String? error;
  List<Value>? values;

  WilayahModel.withError(String errorMessage) {
    error = errorMessage;
  }

  WilayahModel() {
    this.values;
  }

  WilayahModel.fromJson(Map<String, dynamic> json) {
    if (json['value'] != null) {
      values = [];
      json['value'].forEach((v) {
        values!.add(new Value.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.values != null) {
      data['value'] = this.values!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Value {
  String? name;

  Value({
    this.name,
  });

  Value.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    
    return data;
  }
}
