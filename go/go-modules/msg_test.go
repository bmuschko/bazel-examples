package main

import "testing"
import "github.com/stretchr/testify/assert"

func TestMessage(t *testing.T) {
	got := message()
	assert.Equal(t, "Hello World!", got, "Incorrect message: %s", got)
}
