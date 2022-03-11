
import 'dart:convert';

import 'package:jose/jose.dart';
import 'package:uuid/uuid.dart';
import 'package:x509/x509.dart';

class EncryptionUtil {
  String privateKey="-----BEGIN PRIVATE KEY-----\n"+
  "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDhRan+CdzpqeOk"+
  "e+KEtV4QRUoz3S63E9hhXJK7uXjJNua5LK1OaICLupWtMTF2PLXssAbyl3RwDkxQ"+
  "lFzuAKOyaMSAWN/rsuHLG0nL2xGxXIZ/HuSW1XeSihCZ8RjCnEAA/16Sbyt8a+YG"+
  "HkdnJVq5ct1a3A0U4Gl+TM4JtP4lnYGh9wSlYvb9mw5A55B0kE+CGPFhfPF4izMc"+
  "JKPC0qecbdqzrEYuxrqWEyf/q2Ba+b8joZrBH9kPxUxPr2IjqNm3pvdjTnMh2mts"+
  "M2IP2o6zKqyXQKlFeV/XSzSYQGQBbWBjcDTiO5r7xGn10Fj16Yy2VUcpl9ytQ+Lv"+
  "1k5VlXOBAgMBAAECggEAY4jhZIK9Hm1XTQ0D+Dke17eV4rae9nuJRvOdTd7UdKuS"+
  "ZE1OQe/ApHyLt9udjC2lAHCCkVvEMeLPa2cybGLR8XmDIWajgcQnKhPjlnQ0LBbC"+
  "wpZG0DJ/w7rHPQ2fMBXT3dz3z2HZZ/9QwnFMgVGq9XfAQG4sRYYmdoy/GODkzn8l"+
  "/iknIrfgExtBpAagckWZKmvGz5I27y/KwjYH5BabtwmNyFjblbCsmyDugSo75ZaN"+
  "IqQyFZPnKElGhntrnu9lUkKjqjyMDYUp7l3L1CxWX/eS2ViPpPLVNTCdr+9B1rmY"+
  "xGmX7y2r2XLIHEsDONDxZ4SXG/MnKh+uHfS9u+CzAQKBgQD+gb5wcnQjeK4I4cWG"+
  "487f6QBeZkmpKpzT8z0ibJrUlTpaijxni5BQ2/autqZlk8kEkbXWHohThgyFrJ5t"+
  "voAiOIn3R7Ib88ahbaITT4g0cIddkTqLUZMUfgyDSsLBTRXT7RjgeTo1AlttaLdo"+
  "Ut/C3ZNog440pr/hOdC6oityUQKBgQDimALZ9AN63WsVKt1JtuTbUlyy0ELGlNO8"+
  "NUP11qIygsGgD1ntfC24UE0QwsabotegORh4FeazhEouNTZVDB2MeM9qRuAMgslz"+
  "1k87BON+h+6G5b4uK8A5lCAfX5IKuWdjCOGc4R5eee44PizqWAO/kdrf32cVdAAM"+
  "YEk2BPTyMQKBgE87r0EssLF2WaAUQb174KTe0imRaK9Mv+RQXqD/9Lfn+XHEhYeq"+
  "8HPr9wFvhaAsATH19wlBGin+mplnIy+BVjzRI0qjvHRtUVJiYknmwb2ppsrfcr16"+
  "2PJRR638MWOijwAaWVtRAmkMYdBPAIJvApCVENZB1pzXqPcCW9Qutp3xAoGBANYm"+
  "eDtohIlwDa4Zrr3mHnCxbG6KqTFoopuzc6E50l0OetQ87e6md8dEDTGUA4Q/6K3C"+
  "iD+l4z0x/7GgFNNX+e0ymESG62SnjqDtoD/VJPQGoAXZx113d9pzBdDgz/NWukE8"+
  "uY08rSj47400Jdrsh85bmJIQXypFUW5g6ZAmKyFhAoGABfS62Rr/xsa8y9i6WUUd"+
  "VJKW+sptPN3guTIrvgvlvTycGWcmOCbTTfXeYIScl8z97nM+QCl8ooRW+imDwz5h"+
  "qS7t67AxK4AFdc1IVmMmaK2Jy6l/0+XQL1MHbMCz7Mb7DspCQvs2NKy1rMNSttIn"+
  "wLQGryITANLIIoIHo2qDNuU=\n"+
  "-----END PRIVATE KEY-----";

  JsonWebTokenClaims bpiTransactionClaims(String accessToken, String tokenType, String companyId){
    var json = new JsonWebTokenClaims.fromJson({
        "exp": new Duration(hours: 4).inSeconds,
        "iss": "FP",
        "aud": "fp_user",
        "admin":true,
        "sub":"me",
        "access_token":accessToken,
        "token_type":tokenType,
        "jti":Uuid().v1(),
        "companyId":companyId
    });
    print(json.toString());
    return json;
  }
  JsonWebTokenClaims bpiTopupInit(String accessToken, String tokenType, String accountNumberToken, String amount, String remarks, String companyId){
     var mjson = new JsonWebTokenClaims.fromJson({
          "exp": new Duration(hours: 4).inSeconds,
          "iss": "FP",
          "aud": "fp_user",
          "admin":true,
          "sub":"me",
          "access_token":accessToken,
          "token_type":tokenType,
          "jti":Uuid().v1(),
          "account_number_token":accountNumberToken,
          "amount":amount,
          "remarks":remarks,
          "companyId":companyId
      });
    print(mjson.toString());
    return mjson;
  }

  String encryptToJWS(JsonWebTokenClaims claims){
    var builder = JsonWebSignatureBuilder();
    // set the content
    builder.jsonContent = claims.toJson();
    // add a key to sign, can only add one for JWT
    var key = _readPrivateKeyFromFile("RS256");
    builder.addRecipient(key, algorithm: 'RS256');
    // build the jws
    var jws = builder.build();
    // output the compact serialization
    return jws.toCompactSerialization();
  }
    JsonWebKey _readPrivateKeyFromFile(String alg) {
    var v = parsePem(this.privateKey).first;
    var keyPair = (v is PrivateKeyInfo) ? v.keyPair : v as KeyPair;
    var pKey = keyPair.privateKey as RsaPrivateKey;
    String _bytesToBase64(List<int> bytes) {
      return base64Url.encode(bytes).replaceAll('=', '');
    }
    String _intToBase64(BigInt v) {
      return _bytesToBase64(v
          .toRadixString(16)
          .replaceAllMapped(RegExp('[0-9a-f]{2}'), (m) => '${m.group(0)},')
          .split(',')
          .where((v) => v.isNotEmpty)
          .map((v) => int.parse(v, radix: 16))
          .toList());
    }

    return JsonWebKey.fromJson({
      'kty': 'RSA',
      'n': _intToBase64(pKey.modulus),
      'd': _intToBase64(pKey.privateExponent),
      'p': _intToBase64(pKey.firstPrimeFactor),
      'q': _intToBase64(pKey.secondPrimeFactor),
      'alg': alg,
      'kid': 'Authorization'
    });
  }
}