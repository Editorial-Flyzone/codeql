// Code generated by depstubber. DO NOT EDIT.
// This is a simple stub for github.com/codeskyblue/go-sh, strictly for use in testing.

// Source: github.com/codeskyblue/go-sh (exports: ; functions: Command,InteractiveSession)

// Package go_sh is a stub of github.com/codeskyblue/go-sh, generated by depstubber.
package go_sh

import (
	io "io"
	os "os"
	time "time"
)

func Command(_ string, _ ...interface{}) *Session {
	return nil
}

func InteractiveSession() *Session {
	return nil
}

type Session struct {
	Env           map[string]string
	Stdin         io.Reader
	Stdout        io.Writer
	Stderr        io.Writer
	ShowCMD       bool
	PipeFail      bool
	PipeStdErrors bool
}

func (_ *Session) Alias(_ string, _ string, _ ...string) {}

func (_ *Session) Call(_ string, _ ...interface{}) interface {
	Error() string
} {
	return nil
}

func (_ *Session) CombinedOutput() ([]uint8, interface {
	Error() string
}) {
	return nil, nil
}

func (_ *Session) Command(_ string, _ ...interface{}) *Session {
	return nil
}

func (_ *Session) Kill(_ os.Signal) {}

func (_ *Session) Output() ([]uint8, interface {
	Error() string
}) {
	return nil, nil
}

func (_ *Session) Run() interface {
	Error() string
} {
	return nil
}

func (_ *Session) SetDir(_ string) *Session {
	return nil
}

func (_ *Session) SetEnv(_ string, _ string) *Session {
	return nil
}

func (_ *Session) SetInput(_ string) *Session {
	return nil
}

func (_ *Session) SetStdin(_ io.Reader) *Session {
	return nil
}

func (_ *Session) SetTimeout(_ time.Duration) *Session {
	return nil
}

func (_ *Session) Start() interface {
	Error() string
} {
	return nil
}

func (_ *Session) Test(_ string, _ string) bool {
	return false
}

func (_ *Session) UnmarshalJSON(_ interface{}) interface {
	Error() string
} {
	return nil
}

func (_ *Session) UnmarshalXML(_ interface{}) interface {
	Error() string
} {
	return nil
}

func (_ *Session) Wait() interface {
	Error() string
} {
	return nil
}

func (_ *Session) WaitTimeout(_ time.Duration) interface {
	Error() string
} {
	return nil
}

func (_ *Session) WriteStdout(_ string) interface {
	Error() string
} {
	return nil
}
