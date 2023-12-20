This model describes a register file cache.

# `xreg`

This is a genral purpose register.

# The register can be:
* `invalid`
* `dirty`
* `clean`

# The following set of operations is defined:
* `write`
* `read`
* `flush`

# Kripke Structure for `xreg` register:
Atomic propositions: `d`, `v`.
<img src="./xreg.svg">

# Properties:
# Safety:
* Register can not be invalid and dirty at the same time:
```math
AG \neg ( d \wedge \neg v )
```
# Liveness:
* `invalid` state can be achived from any state:
```math
AG AF \neg d \wedge \neg v
```
* `dirty` state can be achived from any state:
```math
AG AF d \wedge v
```
* `clean` state can be achived from any state:
```math
AG AF \neg d \wedge v
```

# `xreg` and `ureg`

`ureg` is a second register in the model.

# LTS multiplication for `xreg` and `ureg` register:
Atomic propositions: `xd`, `xv`, `ud`, `uv`.
<img src="./xureg_mul.svg">

# Constraints:
* Any access to `ureg` makes `xreg` dirty (Meaning: accessing `ureg` clobbers `xreg`).

# Kripke Structure for `xreg` and `ureg` registers:
<img src="./xureg.svg">

# Properties:
# Safety:
* `xreg` register can not be invalid and dirty at the same time:
```math
AG \neg ( xd \wedge \neg xv )
```
* `ureg` register can not be invalid and dirty at the same time:
```math
AG \neg ( ud \wedge \neg uv )
```
* Both registers can not be invalid and dirty at the same time:
```math
AG \neg ( xd \wedge \neg xv \wedge ud \wedge \neg uv)
```
# Liveness:
* `invalid` state of `xreg` can be achived from any state:
```math
AG AF \neg xd \wedge \neg xv
```
* `dirty` state of `xreg` can be achived from any state:
```math
AG AF xd \wedge xv
```
* `clean` state of `xreg` can be achived from any state:
```math
AG AF \neg xd \wedge xv
```
* `invalid` state of `ureg` can be achived from any state:
```math
AG AF \neg ud \wedge \neg uv
```
* `dirty` state of `ureg` can be achived from any state:
```math
AG AF ud \wedge uv
```
* `clean` state of `ureg` can be achived from any state:
```math
AG AF \neg ud \wedge uv
```
* `invalid` state of both regs can be achived from any state:
```math
AG AF \neg xd \wedge \neg xv \wedge \neg ud \wedge \neg uv
```
