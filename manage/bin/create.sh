#!/bin/bash

pthtop="$(cd "$(dirname "${0}")/../../../.." && pwd)"
source "${pthtop}"/manage/lib/params.sh
source "${pthtop}"/manage/lib/shared.sh
source "${pthcrr}"/params.sh

pthkey="${HOME}"/sec/key/.envath_nai.txt
pthlib="${pthsrc}"/export/lib/xoxxox/naiapi

if test ! -e "${pthlib}"
then
  if cnfrtn "import: boilerplate.py: https://github.com/Aedial/novelai-api/blob/main/example/boilerplate.py"
  then
    mkdir -p "${pthlib}"
    if cd "${pthlib}"
    then
      curl -O https://raw.githubusercontent.com/Aedial/novelai-api/main/example/boilerplate.py
      "${pthtop}"/manage/bin/remove.sh
      "${pthtop}"/manage/bin/append.sh
    fi
  fi
fi

if test ! -e "${pthkey}"
then
  cnfrtn "manual: ${pthkey}: NAI_USERNAME=XXX / NAI_PASSWORD=XXX"
fi
addimg ${imgtgt} "${cnfimg}" "${pthdoc}"
