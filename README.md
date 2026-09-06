# CSE 753: Advanced Reinforcement Learning — Notes

LaTeX notes for the CSE 753 course, covering policy gradient methods, actor-critic
methods, off-policy actor-critic, proximal policy optimization, and imitation learning.

## Structure

```
src/
  main.tex                              # entry point, pulls in the main notes
  policy_gradient_methods_part_01.tex
  policy_gradient_methods_part_02.tex
  policy_gradient_methods_part_03.tex
  actor_critic_intro.tex
  actor_critic_algo.tex
  off_policy_actor_critic.tex
  proximal_policy_optimization.tex
  off_policy_actor_critic_02.tex
  imitation_learning.tex                # standalone note, not pulled into main.tex
pdfs/                                    # compiled output PDFs
compile.sh                              # build script for main.tex (bash / macOS, Linux)
compile.ps1                             # build script for main.tex (PowerShell / Windows)
compile_standalone.sh                   # build script for a single .tex file (bash / macOS, Linux)
compile_standalone.ps1                  # build script for a single .tex file (PowerShell / Windows)
```

## Building

Requires a LaTeX distribution with `pdflatex` on your `PATH` (e.g. MiKTeX or TeX Live).

### Main notes (`src/main.tex`)

On macOS/Linux:

```bash
./compile.sh
```

On Windows (PowerShell):

```powershell
./compile.ps1
```

Both scripts run `pdflatex` twice (so the table of contents and cross-references
resolve), write intermediate build artifacts to `build/`, and copy the final PDF to
`pdfs/cse753.pdf`.

### Standalone notes (e.g. `src/imitation_learning.tex`)

Files not pulled into `main.tex` (currently `imitation_learning.tex`) can be compiled
on their own by passing the path to the `.tex` file:

On macOS/Linux:

```bash
./compile_standalone.sh src/imitation_learning.tex
```

On Windows (PowerShell):

```powershell
./compile_standalone.ps1 src/imitation_learning.tex
```

Both scripts run `pdflatex` twice, write intermediate build artifacts to `build/`, and
copy the final PDF to `pdfs/<file-name>.pdf`.
