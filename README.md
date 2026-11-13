# 🌍 Nio Terra — The Sovereign Land Fleet

[![License: BSL 1.1](https://img.shields.io/badge/License-BSL%201.1-blue.svg)](LICENSE)
[![Engine: nio-xs](https://img.shields.io/badge/Engine-nio--xs-orange.svg)](https://github.com/nio-labs/nio-xs)
[![RAM Footprint: Sub-1.5GB](https://img.shields.io/badge/Peak%20RAM-%3C%201.35%20GB-emerald.svg)](#empirical-production-benchmarks-pure-cpu)
[![Zero Cloud Dependency](https://img.shields.io/badge/Privacy-100%25%20Offline-purple.svg)](#sovereign--private)

> **The Zero-Filler Pure-Code Fleet:** While the **Marine Fleet** ([`nio-marine`](https://github.com/nio-labs/nio-marine)) provides conversational pair-programming, exploratory architecture discussions, and empathetic code review, **Nio Terra** is your **pure-code execution force**. Zero conversational filler, zero apologies, mathematical `<think>` invariant verification, and immediate compilable implementations.

---

## 🎯 What is Nio Terra?

Nio Terra models are engineered strictly as **pure-code generation and systems programming engines**. They do not chat; they construct.

- ⚡ **Zero Conversational Filler:** No "Sure, I'd be happy to help!", no pleasantries, and no post-code pleasant chatter. Output begins immediately with code or bounded formal invariant proofs.
- 🔬 **Formal Invariant Verification (`<think>` blocks):** Complex algorithms, memory orderings, atomic CAS loops, and lifetime bounds are mathematically verified inside bounded `<think>...</think>` tags ($\le 150$ tokens) before emitting code.
- 🚀 **Sub-20ms Terminal Reflexes:** Instant syntax refactoring, CLI one-liners, and algorithmic routines running on consumer laptop CPUs.
- 🔒 **100% Sovereign & Offline:** Zero telemetry, zero cloud egress. Proprietary kernels and business logic execute entirely in-process.

---

## 🌍 The Terra Fleet Lineup

| Model | Architecture | Disk Size | Peak Resident RAM (`VmHWM`) | Active Decode (CPU) | Specialization & Role |
| :--- | :--- | :---: | :---: | :---: | :--- |
| 🐆 **Cheetah** | 1.5B (28 Layers) | **1.11 GB** | **`< 460 MB`** | **11.22 tok/s** | **Sovereign Code Sprinter:** Instant terminal commands, syntax transformations, and sub-20ms inline reflex generation. Zero filler. |
| 🐅 **Tiger** | 3.0B (36 Layers) | **2.10 GB** | **`< 720 MB`** *(698 MB)* | **8.5–10.0 tok/s** | **Daily Vibe Coder & Systems Workhorse:** Full production-grade feature authoring, multi-file modules, zero conversational fluff. |
| 🦊 **Fox** | 3.0B (36 Layers) | **2.10 GB** | **`< 720 MB`** *(698 MB)* | **8.5–10.0 tok/s** | **Sovereign Articulate Mentor & Rubber Duck:** Highly chatty, pedagogical pair programming, architectural trade-offs, and interactive code walkthroughs. |
| 🐇 **Rabbit** | 3.0B (36 Layers) | **2.10 GB** | **`< 720 MB`** *(698 MB)* | **8.5–10.0 tok/s** | **Sovereign Deep Thinker & Root-Cause Detective:** Goes down the rabbit hole with step-by-step `<think>` CoT reasoning to solve elusive bugs, race conditions, and architecture bottlenecks. |

---

## ⚡ The Engineering Breakthrough: How Terra Conquers the Memory Wall

Running standard 7B or 8B code models in standard Ollama or llama.cpp consumes **6 GB to 9 GB of RAM**, freezing laptops and triggering OS swapping.

Nio Terra solves this through four synergistic compiler and runtime techniques built into the **`nio-xs`** engine:

```
Traditional Foundation Model (Ollama / Llama.cpp):
[ Model Weights Loaded to Heap ] + [ Static 4GB KV Cache ] + [ FP32 Buffers ]
└──> Spikes to 6,200 MB – 9,000 MB RAM (System Thrashes & OOMs)

Nio Terra (v-µLM Sliding Window + Prefix Cache + nio-xs):
[ mmap Zero-Copy View ] ──> 4-Layer Rolling Window KV ──> Disk Prefix Cache
└──> Cheetah: 460 MB | Tiger: 698 MB | Fox: 698 MB | Rabbit: 698 MB Peak RAM (Silky Smooth)
```

1. **Dynamic Layer Sliding Window:**
   Instead of keeping all transformer layers permanently pinned in physical RAM, `nio-xs` streams layer slices from disk via `mmap` and kernel read-ahead advisories (`libc::madvise(MADV_WILLNEED)`). Resident RAM reflects only active compute blocks.
2. **Disk-Persisted Binary Prefix Cache:**
   Static system prompts and invariant headers are precomputed and cached directly to disk (`~/.nioxs/cache/prefix_*.bin`). Cold-start prefill on CPU drops from **103 seconds down to 10 seconds** (~10× acceleration).
3. **Speculative Decoding (N-gram + Bigram Draft):**
   Cheetah, Tiger, Fox, and Rabbit propose draft tokens using AST bigram lookahead tables and zero-weight candidate caches, achieving speculative speedups on pure CPU.
4. **4-Layer Rolling Window KV:**
   Rather than reserving linear gigabytes for theoretical context windows, KV caches are dynamically bounded to active attention spans, slashing cache overhead by >80%.

---

## 📊 Empirical Production Benchmarks (Pure CPU)

Verified on a consumer laptop CPU without GPU acceleration:

| Benchmark Dimension | Upstream Stock 3B | 🐅 Tiger (3.0B) | 🦊 Fox (3.0B) | 🐇 Rabbit (3.0B) | Upstream Stock 1.5B | 🐆 Cheetah (1.5B) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Peak Resident RAM (RSS)** | `3,400 MB` | **`698 MB`** | **`698 MB`** | **`698 MB`** | `1,850 MB` | **`460 MB`** |
| **Cold Prefill Time** | `24.0 s` | **`10.3 s`** *(Cached)* | **`10.3 s`** *(Cached)* | **`10.3 s`** *(Cached)* | `6.5 s` | **`3.3 s`** *(Instant)* |
| **Active Decode Throughput** | ~5.0 tok/s | **8.50 tok/s** | **8.50 tok/s** | **8.50 tok/s** | ~7.0 tok/s | **11.22 tok/s** |
| **Speculative Acceleration** | ❌ None | **✅ Active (N-gram)** | **✅ Active (N-gram)** | **✅ Active (N-gram)** | ❌ None | **✅ Active (Trio)** |
| **Conversational Style** | High (Chatty) | **Zero (Code Only)** | **High (Articulate Mentor)** | **Deliberate (&lt;think&gt; Detective)** | High (Chatty) | **Zero (Code Only)** |

---

## 🚀 Quickstart & Usage

### 1. Install the Sovereign Engine (`nioxs`)

```bash
curl -fsSL https://raw.githubusercontent.com/nio-labs/nio-xs/main/install.sh | bash
```

### 2. Pull Terra Models

Download and verify cryptographic SHA-256 signatures from [`nio-xs-models`](https://github.com/nio-labs/nio-xs-models):

```bash
# Pull Cheetah (1.5B Code Sprinter, 1.11 GB)
nioxs pull cheetah

# Pull Tiger (3.0B Daily Vibe Coder, 2.10 GB)
nioxs pull tiger

# Pull Fox (3.0B Articulate Mentor & Rubber Duck, 2.10 GB)
nioxs pull fox

# Pull Rabbit (3.0B Deep Thinker & Root-Cause Detective, 2.10 GB)
nioxs pull rabbit
```

### 3. Run Cheetah (Instant Reflex)

```bash
nioxs cheetah "Write an iterative Rust function for Fibonacci"
```

### 4. Run Tiger (Daily Vibe Coding Workhorse)

```bash
nioxs tiger "Write a thread-safe LRU cache in Rust with tests"
```

```rust
use std::collections::{HashMap, LinkedList};
use std::sync::{Arc, Mutex};

pub struct LRUCache<K, V> {
    capacity: usize,
    store: Arc<Mutex<HashMap<K, LinkedList<(K, V)>>>>,
}
...
```

### 5. Run Fox (Articulate Mentor & Interactive Rubber Duck)

```bash
nioxs fox "Why should I use an atomic compare-and-swap (CAS) loop here, and what are the trade-offs?"
```

Fox breaks down the architectural theory, memory ordering implications, and guides you through the concept conversationally.

### 6. Run Rabbit (Deep Thinker & Root-Cause Detective)

```bash
nioxs rabbit "Diagnose subtle memory leak and lock convoy in async broadcast channel"
```

Rabbit goes down the rabbit hole with verified formal invariants inside `<think>` before emitting the diagnosis and production fix:
```rust
<think>
1. Root cause: Lagging broadcast receiver buffers unbounded chunks without yield.
2. Invariant: Buffer capacity must be bounded; drop oldest messages or backpressure sender.
3. Solution: Use tokio::sync::broadcast with Resubscribe and non-blocking try_recv.
</think>
use tokio::sync::broadcast;
...
```

---

## 📜 Fleet Synergy

| Fleet | Specialization | Models |
| :--- | :--- | :--- |
| 🌊 **[`nio-marine`](https://github.com/nio-labs/nio-marine)** | Conversational Pair-Programming & Architectural Reviews | Blue (1.4B), Beluga (3.0B), Manta (494M), Skate (135M) |
| 🌍 **[`nio-terra`](https://github.com/nio-labs/nio-terra)** | Pure-Code Systems Titans, Vibe Coders, Mentors & Deep Thinkers | Cheetah (1.5B), Tiger (3.0B), Fox (3.0B), Rabbit (3.0B) |
| 🦅 **`nio-avian`** | Visual Multimodal & Screenshot Debugging Fleet | *(Coming Soon)* |

---

## 📄 License

Licensed under the [Business Source License 1.1](LICENSE) (BSL 1.1), converting automatically to Apache 2.0 on 2030-01-01. Free for local development, testing, research, and non-hosted enterprise usage.
