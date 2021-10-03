
class HistoryElement {
  int ?id;
  String ?imgPath;
  String ?cnn1;
  String ?knn1;
  String ?svm1;
  String ?result1;
  String ?cnn2;
  String ?knn2;
  String ?svm2;
  String ?result2;

  HistoryElement(
      {this.id,
        this.imgPath,
        this.cnn1,
        this.knn1,
        this.svm1,
        this.result1,
        this.cnn2,
        this.knn2,
        this.svm2,
        this.result2});

  HistoryElement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgPath = json['img_path'];
    cnn1 = json['cnn_1'];
    knn1 = json['knn_1'];
    svm1 = json['svm_1'];
    result1 = json['result_1'];
    cnn2 = json['cnn_2'];
    knn2 = json['knn_2'];
    svm2 = json['svm_2'];
    result2 = json['result_2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img_path'] = this.imgPath;
    data['cnn_1'] = this.cnn1;
    data['knn_1'] = this.knn1;
    data['svm_1'] = this.svm1;
    data['result_1'] = this.result1;
    data['cnn_2'] = this.cnn2;
    data['knn_2'] = this.knn2;
    data['svm_2'] = this.svm2;
    data['result_2'] = this.result2;
    return data;
  }

}
