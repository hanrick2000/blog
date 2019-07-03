```java
Gson gson = new Gson();
gson.fromJson(jsonInString, TheClass.class);
gson.toJson(obj, new FileWriter("D:\\file.json"));

// GsonBuilder
// setPrettyPrinting
// disableHtmlEscaping
// serializeNulls
// registerTypeAdapter
Gson gson = new GsonBuilder().setPrettyPrinting().create();

// JSONParser
// JSONObject, JSONArray
JSONParser parser = new JSONParser();
JSONObject jsonObject = (JSONObject) parser.parse(json);
JSONArray controllers = (JSONArray) jsonObject.get("controllers");

// Convert a JSON Array to a List, using TypeToken
List<Staff> list = gson.fromJson(json, new TypeToken<List<Staff>>(){}.getType());
// Convert a JSON to a Map
Map<String, Object> map = gson.fromJson(json, new TypeToken<Map<String, Object>>(){}.getType());
```

- [Gson extra](https://github.com/google/gson/issues/1104)
  - [RuntimeTypeAdapterFactory](https://github.com/google/gson/blob/master/extras/src/main/java/com/google/gson/typeadapters/RuntimeTypeAdapterFactory.java)
```java
// https://futurestud.io/tutorials/how-to-deserialize-a-list-of-polymorphic-objects-with-gson
builder.registerTypeAdapterFactory(RuntimeTypeAdapterFactory
.of(BaseType.class, "type").registerSubtype(SubType.class,SubType.TYPE))
```

### References
[Jackson Essentials](https://lifelongprogrammer.blogspot.com/2016/03/jackson-essentials-json-libaray.html)