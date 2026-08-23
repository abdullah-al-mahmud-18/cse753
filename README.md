# CSE 753: Advanced Reinforcement Learning — Notes

LaTeX notes for the CSE 753 course, currently covering policy gradient methods.

## Structure

```
src/
  main.tex                              # entry point, pulls in all parts
  policy_gradient_methods_part_01.tex
  policy_gradient_methods_part_02.tex
  policy_gradient_methods_part_03.tex
compile.sh                              # build script (bash / macOS, Linux)
compile.ps1                             # build script (PowerShell / Windows)
```

## Building

Requires a LaTeX distribution with `pdflatex` on your `PATH` (e.g. MiKTeX or TeX Live).

On macOS/Linux:

```bash
./compile.sh
```

On Windows (PowerShell):

```powershell
./compile.ps1
```

Both scripts run `pdflatex` twice (so the table of contents and cross-references resolve), write intermediate build artifacts to `build/`, and copy the final PDF to `cse753.pdf` in the repo root.
