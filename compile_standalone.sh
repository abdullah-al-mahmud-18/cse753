#!/usr/bin/env bash
set -euo pipefail

project_root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [[ $# -ne 1 ]]; then
    printf 'Usage: %s <path-to-tex-file>\n' "$(basename "$0")" >&2
    exit 2
fi

input_path=$1
if [[ "$input_path" != /* ]]; then
    input_path="$project_root/$input_path"
fi

if [[ ! -f "$input_path" ]]; then
    printf 'Error: TeX file not found: %s\n' "$1" >&2
    exit 1
fi

input_path=$(cd "$(dirname "$input_path")" && pwd)/$(basename "$input_path")
source_dir=$(dirname "$input_path")
input_name=$(basename "$input_path")
job_name=${input_name%.tex}
build_dir="$project_root/build"
pdfs_dir="$project_root/pdfs"

mkdir -p "$build_dir" "$pdfs_dir"

compile_args=(
    -interaction=nonstopmode
    -halt-on-error
    "-output-directory=$build_dir"
    "-jobname=$job_name"
    "$input_name"
)

(
    cd "$source_dir"
    pdflatex "${compile_args[@]}"
    pdflatex "${compile_args[@]}"
)

cp "$build_dir/$job_name.pdf" "$pdfs_dir/$job_name.pdf"

printf 'Done. Output: pdfs/%s.pdf\n' "$job_name"