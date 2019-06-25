package main

import "testing"

func TestMessage(t *testing.T) {
	got := message()
	if got != "Hello World!" {
		t.Errorf("Incorrect message: %s", got)
	}
}
