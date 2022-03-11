



import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

class ScanQRUtil{

  Future<Either<Failure, String>> readQRFromFile(File file) async{
    print("Reading QR data from file");
    FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
    });
    Response response = await Dio().post("http://api.qrserver.com/v1/read-qr-code/", data: formData);
    if(response.data.length > 0){
      return Right(response.data[0]["symbol"][0]["data"]);

    }else{
      return Left(UnableToReadQRCodeFailure());
    }
  }

  QRType qrResult = TransferQR();


  String getQRString(String uid){
    if(qrResult is TransferQR){
      return jsonEncode({"type":1, "user_id":uid});
    }else if(qrResult is TransferMerchantQR){
      return jsonEncode({"type":1, "merchant_id":uid});
    }else if(qrResult is TransferBusinessQR){
      return jsonEncode({"type":1, "business_id":uid});
    }else{
      return jsonEncode({"type":1, "user_id":uid});
    }
  }

  Either<Failure, QRType> identifyQRTransaction(String qrstring){
    var json = jsonDecode(qrstring);
    if(json["user_id"] != null){
      this.qrResult=TransferQR();
      return Right(TransferQR());
    }else if(json["merchant_id"] != null){
      this.qrResult=TransferMerchantQR();
      return Right(TransferMerchantQR());
    }else if(json["business_id"] != null){
      return Right(TransferBusinessQR());
    }else if(json["branchName"] != null && json["branchCode"] != null){
      this.qrResult=SupremeCourtQR();
      return Right(SupremeCourtQR());
    }else{
      return Left(UnableToProcessQRCodeFailure());
    }
  }
  
}


class QRType extends Equatable{}
class TransferQR extends QRType{}
class TransferMerchantQR extends QRType{}
class TransferBusinessQR extends QRType{}
///user pre amount 
class TransferPreAmountQR extends QRType{}
///merchant pre amount
class MerchantTransferPreAmountQR extends QRType{}
class SupremeCourtQR extends QRType{}
