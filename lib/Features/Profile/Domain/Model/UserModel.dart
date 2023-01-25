import 'dart:convert';

import '../../../../Assets/AppString.dart';

class UserModel {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? bio;
  bool? status;
  bool? emailNotif;
  bool? verified;
  bool? enable2FA;
  int? followersCount;
  int? followedCount;
  int? hostedEventCount;
  bool? isHost;
  bool? enable2Fa;
  String? type;
  List<dynamic>? events;
  List<dynamic>? cards;
  String? phone;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? wallet;
  String? stripeCustomerId;
  String? avatar;
  UserModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.bio,
    this.status,
    this.emailNotif,
    this.verified,
    this.enable2Fa,
    this.followersCount,
    this.followedCount,
    this.hostedEventCount,
    this.isHost,
    this.type,
    this.events,
    this.cards,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.wallet,
    this.stripeCustomerId,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        bio: json['bio'] as String?,
        status: json['status'] as bool?,
        emailNotif: json['emailNotif'] as bool?,
        verified: json['verified'] as bool?,
        enable2Fa: json['enable2FA'] as bool?,
        followersCount: json['followersCount'] as int?,
        followedCount: json['followedCount'] as int?,
        hostedEventCount: json['hostedEventCount'] as int?,
        isHost: json['isHost'] as bool?,
        type: json['type'] as String?,
        events: json['events'] as List<dynamic>?,
        cards: json['cards'] as List<dynamic>?,
        firstname: json['firstname'] as String?,
        lastname: json['lastname'] as String?,
        phone: json['phone'] as String?,
        email: json['email'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        wallet: json['wallet'] as String?,
        stripeCustomerId: json['stripeCustomerId'] as String?,
        avatar: json['avatar'] != null
            ? '${AppString.imageBaseUrl}${json['avatar']}'
            : '',
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'bio': bio,
        'status': status,
        'emailNotif': emailNotif,
        'verified': verified,
        'enable2FA': enable2Fa,
        'followersCount': followersCount,
        'followedCount': followedCount,
        'hostedEventCount': hostedEventCount,
        'isHost': isHost,
        'type': type,
        'events': events,
        'cards': cards,
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'email': email,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'wallet': wallet,
        'stripeCustomerId': stripeCustomerId,
        'avatar': avatar,
        'id': id,
      };
}
