


import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';

import 'body.dart';
import 'decoder.dart';
import 'network_info.dart';
import 'rest_client.dart';

class NetworkConfigDI extends GetxController{
  final RestClient client = RestClient(); 
  final MyDecoder myDecoder = MyDecoder();
  NetworkInfoImpl networkInfo;
  DataConnectionChecker dataConn = DataConnectionChecker();
  NetworkBody networkBody;
  NetworkConfigDI(){
    this.networkInfo = new NetworkInfoImpl(dataConn);
    networkBody = NetworkBody("4bf735e97269421a80b82359e7dc2288", "I", "", "");
  }


}