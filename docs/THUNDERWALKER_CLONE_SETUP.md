# Thunderwalker / nAIVE Clone Setup

## Clone

```bash
git clone --recursive https://github.com/BetterCodeGoblin/nAIVE.git
cd nAIVE
```

If you already cloned without submodules:

```bash
git submodule update --init --recursive
```

## Linux build notes

nAIVE expects local vendor dependencies for shader/runtime pieces.

Typical flow:

```bash
cp .env.example .env
cargo build --release
```

If vendor dependencies are missing, check:
- `vendor/`
- `.gitmodules`
- project-specific docs in `README.md`

## Thunderwalker work recommendation

For Thunderwalker design work right now:
- use `docs/THUNDERWALKER_GDD.md` as design source of truth
- use `docs/THUNDERWALKER_UE5_SLICE.md` as the fast implementation brief
- prototype the first combat slice in UE5 before committing to engine-specific full production scope

## Sanity checks after clone

```bash
git status
cargo --version
git submodule status
```

You want:
- clean git status
- Rust available
- submodules initialized
