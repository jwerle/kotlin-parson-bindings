kotlin-parson-bindings
======================

Kotlin/Native bindings for [parson](https://github.com/kgabis/parson/), a JSON C library

## Installation

```sh
$ npm install kotlin-parson-bindings
```

## Linking

Use directly with [konanc-config](https://github.com/konanc-config/konanc-config)

```sh
$ konanc main.kt -p program -o main.kexe $(konanc-config --repos --libs kotlin-parson-bindings)
```

or add to a `package.kc` file

```ini
require[] = "kotlin-parson-bindings"
```

## Example

```kotlin
import parson.json_object_get_string
import parson.json_parse_string
import parson.json_object

import kotlinx.cinterop.toKString

fun main(argv: Array<String>) {
  val root = json_parse_string("""{"key": "value"}""")
  val value = json_object_get_string(json_object(root), "key")
  println(value) // value
}
```

## API

Generated from [parson.h](deps/parson/parson.h) with
[cinterop](https://github.com/JetBrains/kotlin-native/blob/master/INTEROP.md).

```kotlin
typealias json_value_typeVar = IntVarOf<json_value_type>
typealias json_value_type = Int

val JSONError: json_value_type get() = -1
val JSONNull: json_value_type get() = 1
val JSONString: json_value_type get() = 2
val JSONNumber: json_value_type get() = 3
val JSONObject: json_value_type get() = 4
val JSONArray: json_value_type get() = 5
val JSONBoolean: json_value_type get() = 6

typealias json_result_tVar = IntVarOf<json_result_t>
typealias json_result_t = Int

val JSONSuccess: json_result_t get() = 0
val JSONFailure: json_result_t get() = -1

typealias JSON_Object = json_object_t

typealias JSON_Array = json_array_t

typealias JSON_Value = json_value_t

typealias JSON_Value_TypeVar = IntVarOf<JSON_Value_Type>
typealias JSON_Value_Type = Int

typealias JSON_StatusVar = IntVarOf<JSON_Status>
typealias JSON_Status = Int

typealias JSON_Malloc_FunctionVar = CPointerVarOf<JSON_Malloc_Function>
typealias JSON_Malloc_Function = CPointer<CFunction<(size_t) -> COpaquePointer?>>

typealias JSON_Free_FunctionVar = CPointerVarOf<JSON_Free_Function>
typealias JSON_Free_Function = CPointer<CFunction<(COpaquePointer?) -> Unit>>

fun json_set_allocation_functions(malloc_fun: JSON_Malloc_Function?, free_fun: JSON_Free_Function?): Unit
fun json_parse_file(filename: String?): CPointer<JSON_Value>?
fun json_parse_file_with_comments(filename: String?): CPointer<JSON_Value>?
fun json_parse_string(string: String?): CPointer<JSON_Value>?
fun json_parse_string_with_comments(string: String?): CPointer<JSON_Value>?
fun json_serialization_size(value: CValuesRef<JSON_Value>?): size_t
fun json_serialize_to_buffer(value: CValuesRef<JSON_Value>?, buf: CValuesRef<ByteVar>?, buf_size_in_bytes: size_t): JSON_Status
fun json_serialize_to_file(value: CValuesRef<JSON_Value>?, filename: String?): JSON_Status
fun json_serialize_to_string(value: CValuesRef<JSON_Value>?): CPointer<ByteVar>?
fun json_serialization_size_pretty(value: CValuesRef<JSON_Value>?): size_t
fun json_serialize_to_buffer_pretty(value: CValuesRef<JSON_Value>?, buf: CValuesRef<ByteVar>?, buf_size_in_bytes: size_t): JSON_Status
fun json_serialize_to_file_pretty(value: CValuesRef<JSON_Value>?, filename: String?): JSON_Status
fun json_serialize_to_string_pretty(value: CValuesRef<JSON_Value>?): CPointer<ByteVar>?
fun json_free_serialized_string(string: CValuesRef<ByteVar>?): Unit
fun json_value_equals(a: CValuesRef<JSON_Value>?, b: CValuesRef<JSON_Value>?): Int
fun json_validate(schema: CValuesRef<JSON_Value>?, value: CValuesRef<JSON_Value>?): JSON_Status
fun json_object_get_value(`object`: CValuesRef<JSON_Object>?, name: String?): CPointer<JSON_Value>?
fun json_object_get_string(`object`: CValuesRef<JSON_Object>?, name: String?): CPointer<ByteVar>?
fun json_object_get_object(`object`: CValuesRef<JSON_Object>?, name: String?): CPointer<JSON_Object>?
fun json_object_get_array(`object`: CValuesRef<JSON_Object>?, name: String?): CPointer<JSON_Array>?
fun json_object_get_number(`object`: CValuesRef<JSON_Object>?, name: String?): Double
fun json_object_get_boolean(`object`: CValuesRef<JSON_Object>?, name: String?): Int
fun json_object_dotget_value(`object`: CValuesRef<JSON_Object>?, name: String?): CPointer<JSON_Value>?
fun json_object_dotget_string(`object`: CValuesRef<JSON_Object>?, name: String?): CPointer<ByteVar>?
fun json_object_dotget_object(`object`: CValuesRef<JSON_Object>?, name: String?): CPointer<JSON_Object>?
fun json_object_dotget_array(`object`: CValuesRef<JSON_Object>?, name: String?): CPointer<JSON_Array>?
fun json_object_dotget_number(`object`: CValuesRef<JSON_Object>?, name: String?): Double
fun json_object_dotget_boolean(`object`: CValuesRef<JSON_Object>?, name: String?): Int
fun json_object_get_count(`object`: CValuesRef<JSON_Object>?): size_t
fun json_object_get_name(`object`: CValuesRef<JSON_Object>?, index: size_t): CPointer<ByteVar>?
fun json_object_set_value(`object`: CValuesRef<JSON_Object>?, name: String?, value: CValuesRef<JSON_Value>?): JSON_Status
fun json_object_set_string(`object`: CValuesRef<JSON_Object>?, name: String?, string: String?): JSON_Status
fun json_object_set_number(`object`: CValuesRef<JSON_Object>?, name: String?, number: Double): JSON_Status
fun json_object_set_boolean(`object`: CValuesRef<JSON_Object>?, name: String?, boolean: Int): JSON_Status
fun json_object_set_null(`object`: CValuesRef<JSON_Object>?, name: String?): JSON_Status
fun json_object_dotset_value(`object`: CValuesRef<JSON_Object>?, name: String?, value: CValuesRef<JSON_Value>?): JSON_Status
fun json_object_dotset_string(`object`: CValuesRef<JSON_Object>?, name: String?, string: String?): JSON_Status
fun json_object_dotset_number(`object`: CValuesRef<JSON_Object>?, name: String?, number: Double): JSON_Status
fun json_object_dotset_boolean(`object`: CValuesRef<JSON_Object>?, name: String?, boolean: Int): JSON_Status
fun json_object_dotset_null(`object`: CValuesRef<JSON_Object>?, name: String?): JSON_Status
fun json_object_remove(`object`: CValuesRef<JSON_Object>?, name: String?): JSON_Status
fun json_object_dotremove(`object`: CValuesRef<JSON_Object>?, key: String?): JSON_Status
fun json_object_clear(`object`: CValuesRef<JSON_Object>?): JSON_Status
fun json_array_get_value(array: CValuesRef<JSON_Array>?, index: size_t): CPointer<JSON_Value>?
fun json_array_get_string(array: CValuesRef<JSON_Array>?, index: size_t): CPointer<ByteVar>?
fun json_array_get_object(array: CValuesRef<JSON_Array>?, index: size_t): CPointer<JSON_Object>?
fun json_array_get_array(array: CValuesRef<JSON_Array>?, index: size_t): CPointer<JSON_Array>?
fun json_array_get_number(array: CValuesRef<JSON_Array>?, index: size_t): Double
fun json_array_get_boolean(array: CValuesRef<JSON_Array>?, index: size_t): Int
fun json_array_get_count(array: CValuesRef<JSON_Array>?): size_t
fun json_array_remove(array: CValuesRef<JSON_Array>?, i: size_t): JSON_Status
fun json_array_replace_value(array: CValuesRef<JSON_Array>?, i: size_t, value: CValuesRef<JSON_Value>?): JSON_Status
fun json_array_replace_string(array: CValuesRef<JSON_Array>?, i: size_t, string: String?): JSON_Status
fun json_array_replace_number(array: CValuesRef<JSON_Array>?, i: size_t, number: Double): JSON_Status
fun json_array_replace_boolean(array: CValuesRef<JSON_Array>?, i: size_t, boolean: Int): JSON_Status
fun json_array_replace_null(array: CValuesRef<JSON_Array>?, i: size_t): JSON_Status
fun json_array_clear(array: CValuesRef<JSON_Array>?): JSON_Status
fun json_array_append_value(array: CValuesRef<JSON_Array>?, value: CValuesRef<JSON_Value>?): JSON_Status
fun json_array_append_string(array: CValuesRef<JSON_Array>?, string: String?): JSON_Status
fun json_array_append_number(array: CValuesRef<JSON_Array>?, number: Double): JSON_Status
fun json_array_append_boolean(array: CValuesRef<JSON_Array>?, boolean: Int): JSON_Status
fun json_array_append_null(array: CValuesRef<JSON_Array>?): JSON_Status
fun json_value_init_object(): CPointer<JSON_Value>?
fun json_value_init_string(string: String?): CPointer<JSON_Value>?
fun json_value_init_number(number: Double): CPointer<JSON_Value>?
fun json_value_init_boolean(boolean: Int): CPointer<JSON_Value>?
fun json_value_init_null(): CPointer<JSON_Value>?
fun json_value_deep_copy(value: CValuesRef<JSON_Value>?): CPointer<JSON_Value>?
fun json_value_free(value: CValuesRef<JSON_Value>?): Unit
fun json_value_get_type(value: CValuesRef<JSON_Value>?): JSON_Value_Type
fun json_value_get_object(value: CValuesRef<JSON_Value>?): CPointer<JSON_Object>?
fun json_value_get_array(value: CValuesRef<JSON_Value>?): CPointer<JSON_Array>?
fun json_value_get_string(value: CValuesRef<JSON_Value>?): CPointer<ByteVar>?
fun json_value_get_number(value: CValuesRef<JSON_Value>?): Double
fun json_value_get_boolean(value: CValuesRef<JSON_Value>?): Int
fun json_type(value: CValuesRef<JSON_Value>?): JSON_Value_Type
fun json_object(value: CValuesRef<JSON_Value>?): CPointer<JSON_Object>?
fun json_array(value: CValuesRef<JSON_Value>?): CPointer<JSON_Array>?
fun json_string(value: CValuesRef<JSON_Value>?): CPointer<ByteVar>?
fun json_number(value: CValuesRef<JSON_Value>?): Double
fun json_boolean(value: CValuesRef<JSON_Value>?): Int

```

## License

MIT
