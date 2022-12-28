// sqlite 에서 스타트시 자동 로그인 할때 필요한 녀석
// 2022-12-25 Hosik
class user_Info {
  final int? UID;
  final String user_id;
  final String user_pw;

  user_Info({
    this.UID,
    required this.user_id,
    required this.user_pw,
  });

  user_Info.formMap(Map<String, dynamic> res)
      : UID = res['UID'],
        user_id = res['user_id'],
        user_pw = res['user_pw'];

  Map<String, Object?> toMap() {
    return {
      'UID': UID,
      'user_id': user_id,
      'user_pw': user_pw,
    };
  }
} //user_Info
