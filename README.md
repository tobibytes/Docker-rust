# Docker-rust

A from-scratch Docker-like container runner in Rust. In-progress solution to the [CodeCrafters "Build Your Own Docker"](https://codecrafters.io/challenges/docker) challenge.

## Status

| Stage | What it does | Status |
| --- | --- | --- |
| 1. Execute a program | Run an arbitrary binary with args, forward stdout/stderr and the exit code | ✅ |
| 2. Wrap stdout/stderr | Capture and re-emit child output exactly | ✅ |
| 3. Chroot | Pivot the child into an isolated root | 🚧 |
| 4. Process isolation (`CLONE_NEWPID`) | Run the child in a new PID namespace via `libc::unshare` | 🚧 |
| 5. Pull from Docker Hub | Authenticate against the registry, fetch image manifest and layer tarballs | 🚧 |
| 6. Extract layers | `flate2` + `tar` to lay each layer on top of the chroot | 🚧 |

Dependencies for the later stages (`libc`, `flate2`, `tar`, `reqwest`, `tempfile`) are already in `Cargo.toml`.

## Run it

```sh
cargo build --release

# Stage 1 — just executes <command> in the host environment
./your_docker.sh run alpine:latest /usr/local/bin/docker-explorer echo hey
```

The `run` and `<image>` arguments are consumed but currently ignored — only `<command>` and its args are executed. Later stages will plug in chroot + namespacing + image fetching.

## Stack

Rust 2021 · `anyhow` · `tokio` · `reqwest` · `serde` · `serde_json` · `libc` · `flate2` · `tar` · `tempfile` · `regex`
