#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

__self="${BASH_SOURCE[0]}"
__dir="$(cd "$(dirname "${__self}")" > /dev/null && pwd)"
__file="${__dir}/$(basename "${__self}")"

murl='https://multiup.org/e079978b475462b327d5880d8cbb63d0'
info='jmmb_avatar.png | 12.96 kB'
anon='https://anonfiles.com/h4kbz4h6z1/jmmb_avatar_png'

expt="${info}"$'\n'"${anon}"
multiups="$(dirname "${__dir}")/multiups"

echo "Running..."
output="$("${multiups}" "${murl}" 2>&1)"
echo "Output:"
echo "${output}"

if [[ "${output}" == "${expt}" ]]; then
	echo 'PASS'
else
	echo 'FAIL'
	exit 1
fi
