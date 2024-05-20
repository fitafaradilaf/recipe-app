import 'dart:convert';
import 'package:http/http.dart' as http;

// Defining a class named ConstantFunction
class ConstantFunction{

  // Defining a static method named getResponse that returns a Future of a List of Maps
  // This method takes a String argument named recipeFind
  static Future<List<Map<String,dynamic>>> getResponse(String recipeFind)async{
    String id = 'affa192a';
    String key = '9973b4f7516859e521e3708b0a87d4e5';
    String search = recipeFind;

    // Defining the API endpoint
    String api = 'https://api.edamam.com/search?q=${recipeFind}&app_id=$id&app_key=$key&from=0&to=100&calories=591-722&health=alcohol-free';
    // Making a GET request to the API endpoint 
    final response = await http.get(Uri.parse(api));
    List<Map<String,dynamic>> recipe = [];

    // Checking if the response status code is 200
    if(response.statusCode==200){
      // Decoding the response body
      var data = jsonDecode(response.body);

      // Checking if the 'hits' key is not null in the decoded data
      if(data['hits']!=null){
        // Looping through each 'hit' in the 'hits' list
        for(var hit in data['hits']){
          // Adding the 'recipe' map from each 'hit' to the 'recipe' list
          recipe.add(hit['recipe']);
        }
      }
      return recipe;
    }
    return recipe;
  }
}