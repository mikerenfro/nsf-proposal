#!/bin/bash

make_build_check_document() {
    basefile=${font}-${engine}${usetg}-${fontsize}
    echo "${basefile}"
    echo "\documentclass[${font}${usetg},${fontsize}]{nsf-proposal} \input{nsf-demo-content}" > ${basefile}.tex
    latexmk -CA ${basefile} >& /dev/null
    latexmk -${engine} ${basefile} < /dev/null >& /dev/null
    if [ -f ${basefile}.pdf ]; then
        pdffonts ${basefile}.pdf
        mkdir -p sample-output/${font}
        mv ${basefile}.pdf sample-output/${font}/
    else
        echo "No output ${basefile}.pdf"
    fi
    rm -f ${basefile}.{aux,bbl,bcf,blg,fdb_latexmk,fls,log,run.xml,xdv}
    # rm -f ${basefile}.tex
    echo ""
}

engine=pdf
usetg=""
for font in cm helvetica palatino; do
    for fontsize in 10pt 11pt 12pt; do
        make_build_check_document
    done
done

engine=pdflua
for font in arial cm courier-new helvetica palatino palatino-linotype times-new-roman; do
    for usetg in ",tg" ""; do
        for fontsize in 10pt 11pt 12pt; do
            make_build_check_document
        done
    done
done

engine=pdfxe
usetg=""
for font in arial cm courier-new helvetica palatino times-new-roman; do
    for fontsize in 10pt 11pt 12pt; do
        make_build_check_document
    done
done
