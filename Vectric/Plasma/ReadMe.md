## Experimental postprocessors/macro for Vectric + grblHAL plasma plugin

* _grblHAL_Plasma_ATC_mm.pp_ - for use with materials. `M190Q<n>` is used to select the material, `<n>` is the tool number = material number.
* _grblHAL_Plasma_mm.pp_ - for use with materials, select material by defining a temporary or use `M190` before starting the program.
* _P100.macros_, use for probing with floating head probe, edit the macro or set the parameter `#<_float_offset>` to the trigger distance.  
Save on a SD card and run with `G65P100`.

The plasma plugin is documented [here](https://grblhal.org/docs/reference/plugins/#plasma-plugin).

---
2026-11-01