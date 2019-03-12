import parson.json_object_get_string
import parson.json_parse_string
import parson.json_object

import kotlinx.cinterop.toKString

import datkt.tape.test

fun main(argv: Array<String>) {
  test("basic") { t ->
    val root = json_parse_string("""{"key": "value"}""")
    val value = json_object_get_string(json_object(root), "key")
    t.equal("value", value?.toKString())
  }

  datkt.tape.collect()
}
