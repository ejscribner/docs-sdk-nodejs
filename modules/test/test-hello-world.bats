# #!./test/libs/bats/bin/bats

load 'test_helper'

@test "[hello-world] - start-using.js" {
  runExample $HELLO_WORLD_DIR start-using.js
  assert_success

  assert_output --partial <<-EOF
GetResult {
  content: {
    type: 'airline',
    id: 8091,
    callsign: 'CBS',
    iata: 'IATA',
    icao: 'ICAO',
    name: 'Couchbase Airways'
  },
EOF
}

@test "[hello-world] - start-using.ts" {
  runTSExample $HELLO_WORLD_DIR start-using.ts
  assert_success

  assert_output --partial <<-EOF
GetResult {
  content: {
    type: 'airline',
    id: 8091,
    callsign: 'CBS',
    iata: 'IATA',
    icao: 'ICAO',
    name: 'Couchbase Airways'
  },
EOF
}

@test "[hello-world] - start-using-ottoman.js" {
  runExample $HELLO_WORLD_DIR start-using-ottoman.js
  assert_success

  # Check output for save[] snippet
  assert_output --partial "Success: airline Couchbase Airways 1 added!"

  # Check output for find[] snippet
  assert_output --partial <<-EOF
Query Result:  [
  _Model {
    callsign: 'CBS',
    iata: 'CBIATA',
    icao: 'CBICAO',
    id: 8091,
    name: 'Couchbase Airways 1',
    type: 'airline'
  }
]
EOF
}

@test "[hello-world] - n1ql-hello-world.js" {
  runExample $HELLO_WORLD_DIR n1ql-hello-world.js
  assert_success

  assert_output --partial "{ greeting: 'Hello World' }"
}

@test "[hello-world] - kv-hello-world-scoped.js" {
  runExample $HELLO_WORLD_DIR kv-hello-world-scoped.js
  assert_success
}

@test "[hello-world] - kv-bulk-hello-world.js" {
  runExample $HELLO_WORLD_DIR kv-bulk-hello-world.js
  assert_success
}

@test "[hello-world] - index-hello-world.js" {
  runExample $HELLO_WORLD_DIR index-hello-world.js
  assert_success
}
