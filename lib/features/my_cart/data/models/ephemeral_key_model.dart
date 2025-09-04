class EphemeralKeyModel {
final String? id;
final String? object;
 // List<AssociatedObject>? associatedObjects;
final int? created;
final int? expires;
final bool? liveMode;
final String? secret;

  EphemeralKeyModel(this.id, this.object, this.created, this.expires, this.liveMode, this.secret);

  factory EphemeralKeyModel.fromJson(Map<String, dynamic> json) => EphemeralKeyModel(json['id'], json['object'], json['created'], json['expires'], json['livemode'], json['secret']);

  toJson() => {
    'id': id,
    'object': object,
    'created': created,
    'expires': expires,
    'livemode': liveMode,
    'secret': secret,
  };
}
// }
// "id": "ephkey_1S3c363nydMbqwkuyBHjnstb",
// "object": "ephemeral_key",
// "associated_objects": [
// {
// "id": "cus_SzaxrQXDIsycAQ",
// "type": "customer"
// }
// ],
// "created": 1756988036,
// "expires": 1756991636,
// "livemode": false,
// "secret": "ek_test_YWNjdF8xUzJoZnMzbnlkTWJxd2t1LHpIcm1taHhmNWJINDY4VDB3QzBhbG93UHhQUUptMDY_00amPVPuAh"