Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Set-Location $PSScriptRoot

New-Item -ItemType Directory -Force build | Out-Null

# Run twice so the table of contents and cross-references resolve correctly.
Push-Location src
try {
    pdflatex -interaction=nonstopmode -output-directory ../build -jobname cse753 main.tex
    if ($LASTEXITCODE -ne 0) { throw "pdflatex failed (pass 1)" }
    pdflatex -interaction=nonstopmode -output-directory ../build -jobname cse753 main.tex
    if ($LASTEXITCODE -ne 0) { throw "pdflatex failed (pass 2)" }
}
finally {
    Pop-Location
}

Copy-Item build/cse753.pdf cse753.pdf -Force

Write-Output "Done. Output: cse753.pdf"
