class BodyBean {
  final String title;
  final String appId;
  final String packName;

  BodyBean(this.title, this.appId, this.packName);

  BodyBean.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        appId = json['appId'],
        packName = json['packName'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'appId': appId,
        'packName': packName,
      };
}
