import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../models/color_model/color_model.dart';

const baseUrl = 'https://www.thecolorapi.com/id?hex=';
const formatPath = '&format=json';

class ColorNameGeneratorService {
  Future<Either<String?, ColorModel>> generatedColorWithHEX(
      String hexCode) async {
    final url = Uri.parse('$baseUrl$hexCode$formatPath');

    final request = await http.get(url);

    if (request.statusCode == HttpStatus.ok) {
      return Right(ColorModel.fromJson(json.decode(request.body)));
    } else {
      return Left(request.body);
    }
  }
}
