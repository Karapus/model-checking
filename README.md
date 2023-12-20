This model describes a register file cache with 3 registers: `xreg`, `ureg`, `mreg`.

Each register can be in one of three states:
* `invalid`
* `dirty`
* `clean`

For each register, the following set of operations is defined:
* `write`
* `read`
* `flush`

The folowing constraints should be satisfied:
* `ureg` can be read from the target only if `mreg` is set to a specific value.
* writing `mreg` and `ureg` clobbers `xreg`.

Kripke Structure for `xreg` register:

<img src="./xreg.svg">
