Mariposa Benchmarks.

To make them compatible with cvc5 syntax, the following changes should be applied:

* Komodo_s: no fix needed.

* Komodo_d: 
    * Convert `bv2int` to `bv2nat`
    * run with `--incremental` option

* Dice:
    * Function `MaxIFuel` declared twice. Delete the second declaration.
    * run with `--incremental` option

* vWasm:
    * Function `MaxIFuel` declared twice. Delete the second declaration.
    * run with `--incremental` option

* VeriBetrKV_D:
    * Convert `bv2int` to `bv2nat`
    * run with `--incremental` option