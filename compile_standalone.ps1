param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$InputFile
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$projectRoot = $PSScriptRoot
$inputPath = if ([IO.Path]::IsPathRooted($InputFile)) {
    $InputFile
} else {
    Join-Path $projectRoot $InputFile
}

if (-not (Test-Path -LiteralPath $inputPath -PathType Leaf)) {
    throw "TeX file not found: $InputFile"
}

$inputPath = (Resolve-Path -LiteralPath $inputPath).Path
$sourceDirectory = Split-Path -Parent $inputPath
$inputName = Split-Path -Leaf $inputPath
$jobName = [IO.Path]::GetFileNameWithoutExtension($inputName)
$buildDirectory = Join-Path $projectRoot "build"
$pdfsDirectory = Join-Path $projectRoot "pdfs"

New-Item -ItemType Directory -Force -Path $buildDirectory | Out-Null
New-Item -ItemType Directory -Force -Path $pdfsDirectory | Out-Null

$pdflatexArguments = @(
    "-interaction=nonstopmode",
    "-halt-on-error",
    "-output-directory=$buildDirectory",
    "-jobname=$jobName",
    $inputName
)

Push-Location $sourceDirectory
try {
    & pdflatex @pdflatexArguments
    if ($LASTEXITCODE -ne 0) { throw "pdflatex failed (pass 1)" }

    & pdflatex @pdflatexArguments
    if ($LASTEXITCODE -ne 0) { throw "pdflatex failed (pass 2)" }
}
finally {
    Pop-Location
}

Copy-Item (Join-Path $buildDirectory "$jobName.pdf") (Join-Path $pdfsDirectory "$jobName.pdf") -Force

Write-Output "Done. Output: pdfs/$jobName.pdf"