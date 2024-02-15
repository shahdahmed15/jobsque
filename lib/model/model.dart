class SocialUserModel{
  String? name;
  String? email;
  String? password;
  String? address;
  String? phone;
  String? bio;
  String? about;
  String? uId;
  String? unvirsity;
  String? title;
  String? startyear;
  String? endyear;
  bool? isEmailVerified;

  SocialUserModel({
    this.name,
    this.email,
    this.password,
    this.address,
    this.bio,
    this.about,
    this.phone,
    this.uId,
    this.unvirsity,
    this.title,
    this.startyear,
    this.endyear,
    this.isEmailVerified,

  });
  factory SocialUserModel.fromJson(Map<String,dynamic>?json){//fatory constructor to create instance= from json
    return SocialUserModel(
      email:json!['email'],
      name:json!['name'],
      password:json!['password'],
      address: json!['address'],
      unvirsity:json!['unvirsity'],
      title:json!['title'],
      startyear:json!['startyear'],
      endyear: json!['endyear'],
      phone: json!['phone'],
      bio: json!['bio'],
      about:json!['about'],
      uId:json!['uId'],
      isEmailVerified:json!['isEmailVerified'],

    );
  }

  Map<String,dynamic>toMap(){
    return{
      "email":email,
      "name":name,
      "password":password,
      "address":address,
      "unvirsity":unvirsity,
      "title":title,
      "startyear":startyear,
      "endyear":endyear,
      "bio":bio,
      "about":about,
      "phone":phone,
      "uId":uId,
      "isEmailVerified":isEmailVerified,

    };
  }
  ///step

}
