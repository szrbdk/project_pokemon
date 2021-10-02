class NamedApiResponse {
  NamedApiResponse({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory NamedApiResponse.fromJson(Map<String, dynamic> json) =>
      NamedApiResponse(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
