#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

__self="${BASH_SOURCE[0]}"
__dir="$(cd "$(dirname "${__self}")" > /dev/null && pwd)"
__file="${__dir}/$(basename "${__self}")"

murl='https://multiup.org/02722133a3bd3d34c4384096c5c3edaa'
info='jmmb_avatar.png | 12.96 kB'
urls=(
	'https://download.gg/file-15651688_a1d4db3a9f6e6848'
	'https://gofile.io/d/tC8bSQ'
	'https://doodrive.com/f/4qx8nx'
	'https://mixdrop.co/f/7ren811obov3kg'
	'https://uptobox.com/9a2hsrq30ubp'
	'https://1fichier.com/?v3zfxfgj4a6gnz52b3b6&af=62851'
)
multiups="$(dirname "${__dir}")/multiups"

code=0
output="$("${multiups}" "${murl}")" || code="$?"
echo "Status: ${code}"
echo "${output}"

fail=0

if [[ "${code}" != 0 ]]; then
	echo 'FAIL: code'
	fail=1
fi

if [[ "${output}" != *"${info}"* ]]; then
	echo 'FAIL: info'
	fail=1
fi

for url in "${urls[@]}"; do
	if [[ "${output}" != *"${url}"* ]]; then
		echo "FAIL: ${url}"
		fail=1
	fi
done

if [[ "${fail}" == 1 ]]; then
	echo 'FAILED'
	exit 1
else
	echo 'PASSED'
fi
